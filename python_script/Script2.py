from ftplib import FTP
import mysql.connector as connector
import mysql.connector.errorcode as errcode
from datetime import datetime
import csv
from pathlib import Path
import os

ftpfolder='/DW'
dirname='csvfile_' + datetime.now().strftime('%Y-%m-%d')

class Script2:
    def __init__(self, user, pw, id):
        self.user = user
        self.pw = pw
        self.id = id
        self.csvfolder=Path('/home/nhannguyen/VSCode/2022_T4_Nhom3/csvfile')
        self._dirname=str(dirname)
        self.csvfile = ftpfolder + '/' + self._dirname

    def connected_db_control(self):
        conn = None
        try:
            conn = connector.connect(host="localhost", user=self.user, password=self.pw, database='control', autocommit=True)
        except connector.Error as err:
            if err == errcode.ER_ACCESS_DENIED_ERROR:
                print('wrong username or password!')
            elif err == errcode.ER_BAD_DB_ERROR:
                print('database is not exist!')
            else:
                print(err)
        else:
            return conn   
    
    def get_status_file(self, conn_control):
        result = None
        try:
            cur=conn_control.cursor()
            cur.callproc('get_status_file')
            for status in cur.stored_results():
                result = status.fetchone()

        except Exception as e:
            print(e)
        
        finally:
            cur.close()
            return result

    def get_config(self, conn_control):
        result = None
        try:
            cur = conn_control.cursor()
            cur.callproc('get_config',[self.id])
            for config in cur.stored_results():
                result = config.fetchone()
        except Exception as e:
            print(e)
        finally:
            cur.close()
            return result

    def ftp_download_csv(self, config, lastfile):
        with FTP(config[2]) as ftp:
            ftp.login(config[3], config[4]) 
            ftp.cwd(self.csvfile)
            
            filename = self.csvfolder.joinpath(lastfile)
            with open(filename, 'wb') as file:
                ftp.retrbinary(f"RETR {lastfile}", file.write)
        return filename

    def connected_db_staging(self, config):
        conn = None
        try:
            conn = connector.connect(host=config[6], user=config[7], password=config[8], database=config[9], autocommit=True)
        except connector.Error as err:
            if err == errcode.ER_ACCESS_DENIED_ERROR:
                print('wrong username or password!')
            elif err == errcode.ER_BAD_DB_ERROR:
                print('database is not exist!')
            else:
                print(err)
        else:
            return conn
    
    def load_staging_raw(self, conn_staging, file_load):
        try:
            cur = conn_staging.cursor()
            with open(file_load, 'r', encoding='utf-8') as csvfile:
                csv_data=csv.reader(csvfile)
                for row in csv_data:
                    cur.callproc('load_data' , row)
        except Exception as e:
            print(e)
        finally:
            cur.close()
    
    def transform1(self, conn_staging):
        try:
            cur = conn_staging.cursor()
            cur.callproc('transform1')
        except Exception as e:
            print(e)
        finally:
            cur.close()

    def transform2(self, conn_staging):
        try:
            cur = conn_staging.cursor()
            cur.callproc('transform2')
        except Exception as e:
            print(e)
        finally:
            cur.close()

    def load_staging_dim_date(self, conn_staging, file_date):
        try:
            cur = conn_staging.cursor()
            with open(file_date, 'r', encoding='utf-8') as csvfile:
                csv_data=csv.reader(csvfile)
                for row in csv_data:
                    cur.callproc('load_staging_dim_date' , row)
        except Exception as e:
            print(e)
        finally:
            cur.close()
    
    def load_staging_dim_time(self, conn_staging, file_time):
        try:
            cur = conn_staging.cursor()
            with open(file_time, 'r', encoding='utf-8') as csvfile:
                csv_data=csv.reader(csvfile)
                for row in csv_data:
                    cur.callproc('load_staging_dim_time' , row)
        except Exception as e:
            print(e)
        finally:
            cur.close()

    def load_staging_dim_province(self,conn_staging):
        try:
            cur = conn_staging.cursor()
            cur.callproc('load_staging_dim_province')
        except Exception as e:
            print(e)
        finally:
            cur.close()
            
    def load_staging_fact_weather(self, conn_staging):
        try:
            cur = conn_staging.cursor()
            cur.callproc('load_staging_fact_weather')
        except Exception as e:
            print(e)
        
        finally:
            cur.close()

script2 = Script2('nhannguyen','123123',1)
conn_control = script2.connected_db_control()
# csvfolder=Path.cwd().parent.joinpath('csvfile')
csvfolder=Path('/home/nhannguyen/VSCode/2022_T4_Nhom3/csvfile')
file_date = csvfolder.joinpath('date_dim_without_quarter.csv')
file_time = csvfolder.joinpath('dim_time.csv')

if(conn_control != None):
    status = script2.get_status_file(conn_control)
    if(status[1].__eq__('re')):
        config = script2.get_config(conn_control)
        ftp_file = script2.ftp_download_csv(config, status[0])
        conn_staging = script2.connected_db_staging(config)
        if(conn_staging != None):
            script2.load_staging_raw(conn_staging, ftp_file)
            script2.transform1(conn_staging)
            script2.transform2(conn_staging)
            script2.load_staging_dim_date(conn_staging, file_date)
            script2.load_staging_dim_time(conn_staging, file_time)
            script2.load_staging_dim_province(conn_staging)
            script2.load_staging_fact_weather(conn_staging)
    else:
        print('file got an error or not ready to load')
Path(ftp_file).unlink()
conn_control.close()
conn_staging.close()