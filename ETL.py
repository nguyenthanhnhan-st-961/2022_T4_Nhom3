import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime

targetfile='etl_data.csv'

def extract():
    data=pd.DataFrame(columns=['Name','Date', 'Time','Temperature','Description','Humidity','Vision','Wind','UV index','Air quality'])

    url='https://thoitiet.vn'
    html=requests.get(url)

    bs=BeautifulSoup(html.text,'html.parser')
    a=bs.find_all('a',title=True)

    provinces={}
    for i in a[:-2]:
        provinces[i.attrs['href']]=i.attrs['title']

    for province in provinces:
        url='https://thoitiet.vn'+province
        content=requests.get(url)
        soup=BeautifulSoup(content.text,'html.parser')
        weather_detail = soup.find_all('span', class_='text-white op-8 fw-bold')
        air=str(soup.find('h2',class_='air-title').string)
        date_time=datetime.now()

        name=provinces[province]
        date = date_time.strftime('%d/%m/%Y')
        time = date_time.strftime('%H:%M')
        temperature=soup.find(class_='current-temperature').string
        description=soup.find(class_='overview-caption-item overview-caption-item-detail').string
        humidity=weather_detail[1].string
        vision=weather_detail[2].string
        wind=weather_detail[3].string
        uv_index=weather_detail[5].string
        air_quality=air.split(': ')[1]
        air_quality=air_quality.split('\r')[0]

        data = pd.concat([data,pd.DataFrame([{'Name':name,'Date':date, 'Time':time,'Temperature':temperature,'Description':description,'Humidity':humidity,'Vision':vision,'Wind':wind,'UV index':uv_index,'Air quality':air_quality}])],ignore_index=True)
    return data
    
def transform(data):
    data['Date']=data['Date'].transform(lambda x: datetime.strptime(x, '%d/%m/%Y').date())
    data['Time']=data["Time"].transform(lambda x: datetime.strptime(x, '%H:%M').time())
    data['Temperature']=data['Temperature'].transform(lambda x : int(x.replace('°', '')))
    data['Humidity']=data['Humidity'].transform(lambda x : int(x.replace('%', '')))
    data['Vision']=data['Vision'].transform(lambda x : float(x.split(" ")[0])) 
    data['Wind']=data['Wind'].transform(lambda x : float(x.split(" ")[0])) 
    return data

def load(targetfile, data):
    data.to_csv(targetfile,mode='a',index=False,header=False)

extracted=extract()
transformed=transform(extracted)
load(targetfile, transformed)