import requests
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import os
# import time
# import schedule

class ExtractWeatherData:
   
    def extract(self, data, provinces):
        data.drop(data.index,inplace=True)
        path='d:\\VSCode\\DataWarehouse\\weather_data_extracted.csv'
        for province in provinces:
            url='https://thoitiet.vn'+province
            content=requests.get(url)
            soup=BeautifulSoup(content.text,'html.parser')
            weather_detail = soup.find_all('span', class_='text-white op-8 fw-bold')
            air=str(soup.find('h2',class_='air-title').string)
            date_time=datetime.datetime.now()

            name=provinces[province]
            date = date_time.strftime('%d/%m/%Y')
            time = date_time.strftime('%H:%M')
            temperature=soup.find(class_='current-temperature').string
            description=soup.find(class_='overview-caption-item overview-caption-item-detail').string
            low_high=weather_detail[0].string
            humidity=weather_detail[1].string
            vision=weather_detail[2].string
            wind=weather_detail[3].string
            uv_index=weather_detail[5].string
            air_quality=air.split(': ')[1]
            air_quality=air_quality.split('\r')[0]

            data = pd.concat([data,pd.DataFrame([{'Name':name,'Date':date, 'Time':time,'Temperature':temperature,'Description':description,'Low/high':low_high,'Humidity':humidity,'Vision':vision,'Wind':wind,'UV index':uv_index,'Air quality':air_quality}])],ignore_index=True)
        data.to_csv(path,mode='a',index=False,header=False)

    # def schedule_extract(self,data,provinces):
    #     schedule.every(1).minutes.do(self.extract,data,provinces)

    #     while True:
    #         schedule.run_pending()
    #         time.sleep(1)

data=pd.DataFrame(columns=['Name','Date', 'Time','Temperature','Description','Low/high','Humidity','Vision','Wind','UV index','Air quality'])

url='https://thoitiet.vn'
html=requests.get(url)

bs=BeautifulSoup(html.text,'html.parser')
a=bs.find_all('a',title=True)

provinces={}
for i in a[:-2]:
    provinces[i.attrs['href']]=i.attrs['title']

ewd=ExtractWeatherData()
ewd.extract(data,provinces)
   