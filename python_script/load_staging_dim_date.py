import mysql.connector as connector
import csv

def load_staging_dim_date(filename):
    try:
        query=''
        conn = connector.connect(host='localhost', user='nhannguyen', password='admin', database='staging', autocommit=True)
        cur = conn.cursor()
        cur.execute(query)
    except Exception as e:
        print(e)

load_staging_dim_date(r'D:\VSCode\DataWarehouse\csvfile\date_dim_without_quarter.csv')