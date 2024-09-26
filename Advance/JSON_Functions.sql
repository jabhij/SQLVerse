"""
    It's common in data engineering workflows to ingest data from API's. The API responses are typically 
    stored in a data lake as JSON. But until JSON is transformed, the data will mostly be useless.
    SQL JSON functions let us parse JSON to extract the data inside. It allows us to turn semi-structured 
    JSON data can be converted into tabular data to work with it in SQL.
	
    Here are two SQL JSON functions (Google BigQuery):
		- JSON_EXTRACT() returns the actual JSON string
		- JSON_EXTRACT_SCALAR() returns a scalar value (boolean, number, or string)
    
	Here are four SQL JSON functions (PostgreSQL):
   		- JSON_EXTRACT_PATH_TEXT() extracts a text value from a JSON document
		- JSON_EXTRACT_PATH_NUMBER() extracts a numeric value from a JSON document
		- JSON_EXTRACT_PATH_BOOLEAN() extracts a boolean value from a JSON document
		- JSON_EXTRACT_PATH() extracts a value of any type from a JSON document
        
    While MySQL has all the six functions.
"""

-- Google BigQuery
SELECT 
  JSON_EXTRACT('{"name": "Jakob", "age": "6" }', '$.name') AS json_name,
  JSON_EXTRACT_SCALAR('{"name": "Jakob", "age": "6" }', '$.name') AS scalar_name,
  JSON_EXTRACT('{"name": "Jakob", "age": "6" }', '$.age') AS json_age,
  JSON_EXTRACT_SCALAR('{"name": "Jakob", "age": "6" }', '$.age') AS scalar_age;

-- PostgreSQL
SELECT
  JSON_EXTRACT_PATH_TEXT('{"name": "Jakob", "age": "6" }', '$.name') AS json_name,
  JSON_EXTRACT_PATH_TEXT('{"name": "Jakob", "age": "6" }', '$.name') AS scalar_name,
  JSON_EXTRACT_PATH_TEXT('{"name": "Jakob", "age": "6" }', '$.age') AS json_age,
  JSON_EXTRACT_PATH_NUMBER('{"name": "Jakob", "age": "6" }', '$.age') AS scalar_age;

-- SQL Fiddle
"""
	https://sqlfiddle.com/postgresql/online-compiler?id=948e35a4-f21b-4e9f-85bf-b62fd5470a19
"""
