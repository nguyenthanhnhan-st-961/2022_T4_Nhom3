import mysql.connector
from mysql.connector import errorcode
import csv

csv_file='etl_data.csv'

def staging(csv_file):
    try:
        conn = mysql.connector.connect(host='localhost', user='nhannguyen', password='admin', database='staging', autocommit=True)
        print("Connection is established")
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print('Something was wrong with the username or password!')
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist!")
        else:
            print(err)
    else:
        cur = conn.cursor()
        print('loading...')
        csv_insert='insert into weather_data (Name,Date, Time,Temperature,Description,Humidity,Vision,Wind,UV_index,Air_quality) \
        values \
        (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
        select='select * from weather_data'
        with open(csv_file, 'r', encoding='utf-8') as csvfile:
            csv_data=csv.reader(csvfile)
            for row in csv_data:
                cur.execute(csv_insert, row)

        cur.close()
        conn.close()
        print('Done.')

staging(csv_file)