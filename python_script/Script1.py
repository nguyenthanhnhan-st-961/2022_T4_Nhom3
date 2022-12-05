import mysql.connector as connector
from mysql.connector import errorcode as errcode
import requests
import pandas as pd
from bs4 import BeautifulSoup
from datetime import datetime
import _thread
import os
from pathlib import Path, PurePosixPath
from ftplib import FTP

csvfolder=Path.cwd().joinpath('csvfile')
extract_path = csvfolder.joinpath((datetime.now().strftime('%Y%m%d%H%M')+"_extracted_data.csv"))
preprocess_path = csvfolder.joinpath((datetime.now().strftime('%Y%m%d%H%M')+"_preprocessed_data.csv"))

ftpfolder='/DW'
dirname='csvfile_' + datetime.now().strftime('%Y-%m-%d')

class Script1:
    def __init__(self, user, pw, id, author) -> None:
        self.user = user
        self.pw = pw
        self.id = id
        self.author = author
        self.extract_filename = extract_path
        self.preprocess_filename = preprocess_path
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
    
    def get_config(self, conn):
        try:
            cur = conn.cursor()
            cur.callproc('get_config',[self.id])
            for config in cur.stored_results():
                result = config.fetchone()
        except Exception as e:
            print(e)
        else:
            cur.close()
            return result

    def connected_source(self, config):
        try:
            url = config[1]
            html = requests.get(url)
        except Exception as e:
            print(e)
        else:
            if(html.status_code == 200):
                return html
            else:
                return None

    def extract(self, config, source):
        data=pd.DataFrame(columns=['Name','Date', 'Time','Temperature','Description','Humidity','Vision','Wind','UV index','Air quality'])
        try:
            url = config[1]
            bs=BeautifulSoup(source.text,'html.parser')
            tag_a=bs.find_all('a',title=True)
            provinces={}
            for i in tag_a[:-2]:
                provinces[str(i.attrs['href']).lstrip('/')]=str(i.attrs['title'])
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
        except Exception as e:
            print(e)
        else:
            data.to_csv(self.extract_filename,index=False,lineterminator='\n')
        return data

    def preprocess(self, data):
        data['Date']=data['Date'].transform(lambda x: datetime.strptime(x, '%d/%m/%Y').date())
        data['Time']=data["Time"].transform(lambda x: datetime.strptime(x, '%H:%M').time())
        data['Temperature']=data['Temperature'].transform(lambda x : int(x.replace('°', '')))
        data['Humidity']=data['Humidity'].transform(lambda x : int(x.replace('%', '')))
        data['Vision']=data['Vision'].transform(lambda x : float(x.split(" ")[0])) 
        data['Wind']=data['Wind'].transform(lambda x : float(x.split(" ")[0]))

        data.to_csv(self.preprocess_filename,index=False,lineterminator='\n',header=False)

    def add_log(self, conn):
        try:
            filename = os.path.basename(self.preprocess_filename)
            cur = conn.cursor()
            cur.callproc('add_log', [self.id, filename, datetime.now().date(), self.author])
        except Exception as e:
            print(e)
        else:
            cur.close()

    def update_log_status_re(self, conn):
        try:
            cur = conn.cursor()
            cur.callproc('update_log_status_re')
        except Exception as e:
            print(e)
        else:
            cur.close()

    def update_log_status_er(self, conn):
        try:
            cur = conn.cursor()
            cur.callproc('update_log_status_er')
        except Exception as e:
            print(e)
        else:
            cur.close()

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

script1 = Script1('nhannguyen', '123123', 1, 'Nhan')
conn = script1.connected_db_control()

if conn != None:
    config = script1.get_config(conn)
    source = script1.connected_source(config)
    
    if source != None:
        extracted_file = open(script1.extract_filename, 'w', encoding='utf8')
        preprocessed_file = open(script1.preprocess_filename, 'w', encoding='utf8')

        _thread.start_new_thread(script1.add_log, (conn,))

        extracted = script1.extract(config, source)
        script1.preprocess(extracted)

        extracted_file.close()
        preprocessed_file.close()

with open(script1.preprocess_filename, 'r') as file:
    if os.path.getsize(script1.preprocess_filename) > 0:
        _thread.start_new_thread(script1.update_log_status_re,(conn,))
        script1.ftp_upload_csv(config)
    else:
        script1.update_log_status_er(conn,)
conn.close()
Path(script1.extract_filename).unlink()
Path(script1.preprocess_filename).unlink()