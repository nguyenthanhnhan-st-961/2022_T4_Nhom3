import mysql.connector
import mysql.connector.errorcode as errcode
import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime
import _thread
import os
from pathlib import Path
from ftplib import FTP

csvfolder=Path('d:/VSCode/DataWarehouse/csvfile')
extract_path = csvfolder / (datetime.now().strftime('%Y%m%d%H%M')+"_extracted_data.csv")
preprocess_path=csvfolder / (datetime.now().strftime('%Y%m%d%H%M')+"_preprocessed_data.csv")

ftpfolder='/DW'
dirname='csvfile_' + datetime.now().strftime('%Y-%m-%d')

class MyScript1:

    def __init__(self,id,author):
        self.id=id
        self.author=author
        self.extract_filename = str(extract_path)
        self.preprocess_filename = str(preprocess_path)
        self._dirname=str(dirname)
        self.csvfile = ftpfolder + '/' + self._dirname

    def add_config(self, source_url, ftp_ip, ftp_user, ftp_pw, ftp_port):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control", autocommit=True)
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
            cur.callproc('add_config',[source_url, ftp_ip, ftp_user, ftp_pw, ftp_port])

            cur.close()
            conn.close()
            print('Done!')

    def get_config(self):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control", autocommit=True)
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

    def connect_source(self, config):
        try:
            url=config[1]
            html=requests.get(url)
            if(html.status_code != 200):
                if(html.status_code == 404):
                    print(html.status_code + '\nPage not found, please check URL')
                    return False
                else:
                    print(html.status_code)
                    return False
            else:
                return True
        except Exception as e:
            print(e)

    def extract(self, config):
        try:
            data=pd.DataFrame(columns=['Name','Date', 'Time','Temperature','Description','Humidity','Vision','Wind','UV index','Air quality'])
            url=config[1]
            html=requests.get(url)
            bs=BeautifulSoup(html.text,'html.parser')
            a=bs.find_all('a',title=True)
            provinces={}
            for i in a[:-2]:
                provinces[str(i.attrs['href']).lstrip('/')]=str(i.attrs['title'])

        except Exception as e:
            print(e)
        else:
            try:
                for province in provinces:
                    content=requests.get(url+province)
                    soup=BeautifulSoup(content.text,'html.parser')
                    weather_detail = soup.find_all('span', class_='text-white op-8 fw-bold')
                    air=str(soup.find('h2',class_='air-title').string).strip()
                    date_time=datetime.now()

                    name=provinces[province]
                    date = date_time.strftime('%d/%m/%Y')
                    time = date_time.strftime('%H:%M')
                    temperature = str(soup.find(class_='current-temperature').string).strip()
                    description = str(soup.find(class_='overview-caption-item overview-caption-item-detail').string).strip()
                    humidity = str(weather_detail[1].string).strip()
                    vision = str(weather_detail[2].string).strip()
                    wind=str(weather_detail[3].string).strip()
                    uv_index=str(weather_detail[5].string).strip()
                    air_quality=air.split(': ')[-1].strip()

                    data = pd.concat([data,pd.DataFrame([{'Name':name,'Date':date, 'Time':time,'Temperature':temperature,'Description':description,'Humidity':humidity,'Vision':vision,'Wind':wind,'UV index':uv_index,'Air quality':air_quality}])],ignore_index=True)
            except AttributeError as e:   
                print(e)
            else:
                data.to_csv(self.extract_filename,index=False,line_terminator='\n')
        return data

    def preprocess(self, data):
        data['Date']=data['Date'].transform(lambda x: datetime.strptime(x, '%d/%m/%Y').date())
        data['Time']=data["Time"].transform(lambda x: datetime.strptime(x, '%H:%M').time())
        data['Temperature']=data['Temperature'].transform(lambda x : int(x.replace('°', '')))
        data['Humidity']=data['Humidity'].transform(lambda x : int(x.replace('%', '')))
        data['Vision']=data['Vision'].transform(lambda x : float(x.split(" ")[0])) 
        data['Wind']=data['Wind'].transform(lambda x : float(x.split(" ")[0])) 
        return data
    
    def load(self, data):
        data.to_csv(self.preprocess_filename,index=False,line_terminator='\n',header=False)
    
    def add_log(self, config, filename):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control", autocommit=True)
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
            cur.callproc('add_log',[config[0], filename, datetime.now().date(), self.author])

            cur.close()
            conn.close()
            print('Done!')

    def update_log_status_re(self):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control", autocommit=True)
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
            cur.callproc('update_log_status_re')

            cur.close()
            conn.close()
            print('Done!')

    def update_log_status_er(self):
        try:
            conn = mysql.connector.connect(host="localhost", user="nhannguyen", password="admin", database="control", autocommit=True)
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
            cur.callproc('update_log_status_er')

            cur.close()
            conn.close()
            print('Done!')

    def ftp_upload_csv(self,config):
        try:
            with FTP(config[2]) as server:
                server.login(config[3],config[4])
                server.encoding = 'utf-8'
                server.cwd(ftpfolder)
        
                if self._dirname not in server.nlst():
                    server.mkd(self.csvfile)
                server.cwd(self._dirname)
                
                with open(self.extract_filename, 'rb') as file:
                    server.storbinary(f"STOR {os.path.basename(self.extract_filename)}", file)
                with open(self.preprocess_filename, 'rb') as file:
                    server.storbinary(f"STOR {os.path.basename(self.preprocess_filename)}", file)
        except Exception as e:
            print(e)


myscript1 = MyScript1(1,'Nhan')
extracted_file = open(myscript1.extract_filename, 'w', encoding='utf8')
preprocessed_file = open(myscript1.preprocess_filename, 'w', encoding='utf8')
config = myscript1.get_config()
connect = myscript1.connect_source(config)
if connect:
    try:
        _thread.start_new_thread(myscript1.add_log, (config, os.path.basename(myscript1.preprocess_filename),))
        
    except Exception as e:
        print(e)
    else:
        extracted = myscript1.extract(config)
        proprocessed = myscript1.preprocess(extracted)
        myscript1.load(proprocessed)
        extracted_file.close()
        preprocessed_file.close()

else:
    print("cannot connect!")

with open(myscript1.preprocess_filename, 'r') as file:
    if os.path.getsize(myscript1.preprocess_filename) > 0:
        _thread.start_new_thread(myscript1.update_log_status_re,())
        myscript1.ftp_upload_csv(config)
    else:
        myscript1.update_log_status_er()

os.remove(myscript1.extract_filename)
os.remove(myscript1.preprocess_filename)