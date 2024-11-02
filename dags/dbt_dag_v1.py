from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 11, 1),
}

with DAG('my_dag', default_args=default_args, schedule='@daily') as dag:
    start = EmptyOperator(task_id='start')
