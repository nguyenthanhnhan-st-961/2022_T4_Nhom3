import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime
import read_config

extracted_file='csvfile\extracted_data.csv'
preprocessed_file='csvfile\preprocessed_data.csv'

def extract():
    data=pd.DataFrame(columns=['Name','Date', 'Time','Temperature','Description','Humidity','Vision','Wind','UV index','Air quality'])
    try:
        url=read_config.get_config(1)[0][1]
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
            data.to_csv(extracted_file,index=False,header=False)
    return data
    
def transform(data):
    data['Date']=data['Date'].transform(lambda x: datetime.strptime(x, '%d/%m/%Y').date())
    data['Time']=data["Time"].transform(lambda x: datetime.strptime(x, '%H:%M').time())
    data['Temperature']=data['Temperature'].transform(lambda x : int(x.replace('°', '')))
    data['Humidity']=data['Humidity'].transform(lambda x : int(x.replace('%', '')))
    data['Vision']=data['Vision'].transform(lambda x : float(x.split(" ")[0])) 
    data['Wind']=data['Wind'].transform(lambda x : float(x.split(" ")[0])) 
    return data

def load(preprocessed_file, data):
    data.to_csv(preprocessed_file,index=False,header=False)
extracted=extract()
# transformed=transform(extracted)
# load(preprocessed_file, transformed)