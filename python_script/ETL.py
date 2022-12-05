# import the libraries

from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

#defining DAG arguments

# You can override them on a per-task basis during operator initialization
default_args = {
    'owner': 'Nhan Nguyen',
    'start_date': days_ago(0),
    'email': ['nguyenthanhnhan07052017@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# define the DAG
dag = DAG(
    dag_id='etl-dag',
    default_args=default_args,
    description='ETL DAG using Bash to Data Warehouse',
    schedule_interval=timedelta(minutes=3),
)

# define the tasks

# define the first task named extract
extract = BashOperator(
    task_id='extract',
    bash_command='python3 /mnt/d/VSCode/DataWarehouse/python_script/Script1.py',
    dag=dag,
)


# define the second task named transform
transform = BashOperator(
    task_id='transform',
    bash_command='python3 /mnt/d/VSCode/DataWarehouse/python_script/Script2.py',
    dag=dag,
)

# define the third task named load

load = BashOperator(
    task_id='load',
    bash_command='python3 /mnt/d/VSCode/DataWarehouse/python_script/Script3.py',
    dag=dag,
)

# task pipeline
extract >> transform >> load