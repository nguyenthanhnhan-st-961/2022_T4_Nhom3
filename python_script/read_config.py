import mysql.connector
import mysql.connector.errorcode as errcode

def add_config(source_url, ftp_ip, ftp_user, ftp_pw, ftp_port):
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

def get_config(id):
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
        cur.callproc('get_config',[id])
        for config in cur.stored_results():
           result = config.fetchall()

        cur.close()
        conn.close()
        print('Done!')
        return result
config = get_config(1)
print(config)
