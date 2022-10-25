from ftplib import FTP
import mysql.connector
import mysql.connector.errorcode as errcode
from datetime import datetime
import csv
import os

ftpfolder='/DW'
dirname='csvfile_' + datetime.now().strftime('%Y-%m-%d')

class MyScript2:
    def __init__(self, id):
        self.id = id
        self.csvfolder=r'D:\VSCode\DataWarehouse\csvfile'
        self._dirname=str(dirname)
        self.csvfile = ftpfolder + '/' + self._dirname

    def get_config(self):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control")
            print("Connection is establish")
        except mysql.connector.Error as err:
            if err == errcode.ER_ACCESS_DENIED_ERROR:
                print('Something was wrong with the username or password!')
            elif err == errcode.ER_BAD_DB_ERROR:
                print("Database is not exist")
            else:
                print(err)
        else:
            cur=conn.cursor()
            cur.callproc('get_config',[self.id])
            for config in cur.stored_results():
                result = config.fetchone()

            cur.close()
            conn.close()
            print('Done!')
            return result

    def ftp_download_csv(self, config, csvfile):
        with FTP(config[2]) as ftp:
            ftp.login(config[3], config[4])
            ftp.cwd(csvfile) # csvfile = myscript1.csvfile
            
            lastfile=ftp.nlst()[0]
            for file in ftp.nlst():
                info = file.split('_')
                if lastfile.split('_')[0] <= info[0] and info[1].__eq__('preprocessed'):
                    lastfile = file
            filename = self.csvfolder + '/' + lastfile
            with open(filename, 'wb') as file:
                ftp.retrbinary(f"RETR {lastfile}", file.write) # filename = os.path.basename(myscript1.preprocess_filename)
        return filename
    
    def load_staging(self, file_load):
        try:
            conn = mysql.connector.connect(host='localhost', user='nhannguyen', password='admin', database='staging', autocommit=True)
            print("Connection is established")
        except mysql.connector.Error as err:
            if err.errno == errcode.ER_ACCESS_DENIED_ERROR:
                print('Something was wrong with the username or password!')
            elif err.errno == errcode.ER_BAD_DB_ERROR:
                print("Database does not exist!")
            else:
                print(err)
        else:
            cur = conn.cursor()
            print('loading...')
            
            with open(file_load, 'r', encoding='utf-8') as csvfile:
                csv_data=csv.reader(csvfile)
                for row in csv_data:
                    cur.callproc('load_data' , row)

            cur.close()
            conn.close()
            print('Done.')

    def transform_1():
        pass
    
    def transform_2():
        pass

    def load_staging_fact_dim():
        pass

myscript2 = MyScript2(1)

config = myscript2.get_config()
print(config)
file_load = myscript2.ftp_download_csv(config, myscript2.csvfile)
myscript2.load_staging(file_load)
os.remove(file_load)