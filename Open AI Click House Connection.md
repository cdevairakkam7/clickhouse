```python
pip install -q clickhouse-sqlalchemy
```


```python
import clickhouse_connect
client = clickhouse_connect.get_client(host='localhost', port=18123, username='chris', password='chris',database='mind_ark_test')
from tabulate import tabulate
```


```python
from langchain import OpenAI, SQLDatabase
from langchain.chains import create_sql_query_chain
```


```python
OPENAI_API_KEY = 'Your API Key'
```


```python
clickhouse_url ='clickhouse://chris:chris@localhost:18123/mind_ark_test'
db = SQLDatabase.from_uri(clickhouse_url,sample_rows_in_table_info=1, include_tables=['sales'])
```


```python
llm = OpenAI(temperature=0, openai_api_key=OPENAI_API_KEY)  
#database_chain = create_sql_query_chain(llm,db,context=context)
database_chain = create_sql_query_chain(llm,db)
```


```python
prompt = "list five columns from sales"

sql_query = database_chain.invoke({"question": prompt})


print(f'\n \n  \n \n The SQL Query - {sql_query} \n \n  \n \n')


result = client.query_df(sql_query.replace('"', ''))
print(tabulate(result, headers='keys', tablefmt='grid'))

```

    
     
      
     
     The SQL Query - SELECT region, country, item_type, sales_channel, order_priority FROM sales LIMIT 5 
     
      
     
    
    +----+--------------------+--------------+-------------+-----------------+------------------+
    |    | region             | country      | item_type   | sales_channel   | order_priority   |
    +====+====================+==============+=============+=================+==================+
    |  0 | Sub-Saharan Africa | Sierra Leone | Fruits      | Offline         | M                |
    +----+--------------------+--------------+-------------+-----------------+------------------+
    |  1 | Sub-Saharan Africa | Sierra Leone | Fruits      | Offline         | M                |
    +----+--------------------+--------------+-------------+-----------------+------------------+
    |  2 | Sub-Saharan Africa | Sierra Leone | Fruits      | Offline         | M                |
    +----+--------------------+--------------+-------------+-----------------+------------------+
    |  3 | Europe             | Sweden       | Household   | Offline         | H                |
    +----+--------------------+--------------+-------------+-----------------+------------------+
    |  4 | Europe             | Sweden       | Household   | Offline         | H                |
    +----+--------------------+--------------+-------------+-----------------+------------------+



```python

```
