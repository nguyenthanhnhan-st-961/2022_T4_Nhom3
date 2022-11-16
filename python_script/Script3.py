# from typing import final
import mysql.connector as connector
from mysql.connector import errorcode as errcode

class Script3:
    def __init__(self, user, pw, id):
        self.user = user
        self.pw = pw
        self.id = id

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

    def connected_db_dw(self, config):
        conn = None
        try:
            conn = connector.connect(host=config[6],user=config[7],password=config[8],database=config[10])
        except Exception as e:
            print(e)

        finally:
            return conn
        
    def get_dw_(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('')
            
        except Exception as e:
            print(e)
            

    def load_dw_fact_weather(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('load_dw_fact_weather')
        
        except Exception as e:
            print(e)

        finally:
            cur.close()

script3 = Script3('nhannguyen', '123123 ', 1)
conn_control = script3.connected_db_control()
if(conn_control != None):
    config = script3.get_config(conn_control)
    conn_dw = script3.connected_db_dw(config)
    if(conn_dw != None):
        script3.load_dw_fact_weather(conn_dw)