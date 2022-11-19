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
            conn = connector.connect(host=config[6],user=config[7],password=config[8],database=config[10],autocommit=True)
        except Exception as e:
            print(e)

        finally:
            return conn
        
    def load_dw_dim_date(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('load_dw_dim_date')
        except Exception as e:
            print(e)
        finally:
            cur.close()
            
    def load_dw_dim_time(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('load_dw_dim_time')
        except Exception as e:
            print(e)
        finally:
            cur.close()
            
    def load_dw_dim_province(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('load_dw_dim_province')
        except Exception as e:
            print(e)
        finally:
            cur.close()
            
    def load_dw_fact_weather(self, conn_dw):
        try:
            cur = conn_dw.cursor()
            cur.callproc('load_dw_fact_weather')
        
        except Exception as e:
            print(e)

        finally:
            cur.close()

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

    def truncate_staging(self, conn_staging):
        try:
            cur = conn_staging.cursor()
            cur.callproc('truncate_staging')
        except Exception as e:
            print(e)
        finally:
            cur.close()

script3 = Script3('nhannguyen','123123',1)
conn_control = script3.connected_db_control()

if(conn_control != None):
    config = script3.get_config(conn_control)
    conn_dw = script3.connected_db_dw(config)
    conn_staging = script3.connected_db_staging(config)
    if(conn_dw != None):
        script3.load_dw_dim_date(conn_dw)
        script3.load_dw_dim_time(conn_dw)
        script3.load_dw_dim_province(conn_dw)
        script3.load_dw_fact_weather(conn_dw)
    else:
        print('can not connect to database data_warehouse')
    
    if(conn_staging != None):
        script3.truncate_staging(conn_staging)

conn_control.close()
conn_dw.close()
conn_staging.close()