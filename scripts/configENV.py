from dotenv import set_key, load_dotenv
import json
import os    

file_path = "/home/ubuntu/output.json"
if os.path.exists(file_path):
    blank_json = {}
    try:
      f = open(file_path, "r")
      data = json.load(f)
      f.close()
    except:
      print("Decode error in .env file")
else : 
   print(".env path is wrong or does not exist")

# Load all the values
node_env = 'production'

database_host = data['AWS_RDS_Details']['value']['db_hostname']
database_name = data['AWS_RDS_Details']['value']['db_name']
database_username = data['AWS_RDS_Details']['value']['db_username']
database_password = 'password'

aws_access_key_id = 'AKIA2WXHFVL4V66VYRAY'
aws_access_secret = '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'

aws_region = data['AWS_S3_BUCKET_DETAILS']['value']['s3_bucket_region']
aws_bucket_name = data['AWS_S3_BUCKET_DETAILS']['value']['s3_bucket_name']

envPath = '/home/ubuntu/strapiApp/.env'
load_dotenv(envPath)

# Update the values in the .env file
set_key(envPath, 'NODE_ENV', node_env)

set_key(envPath, 'DATABASE_HOST', database_host)
set_key(envPath, 'DATABASE_PORT', '5432')
set_key(envPath, 'DATABASE_NAME', database_name)
set_key(envPath, 'DATABASE_USERNAME', database_username)
set_key(envPath, 'DATABASE_PASSWORD', database_password)

set_key(envPath, 'AWS_ACCESS_KEY_ID', aws_access_key_id)
set_key(envPath, 'AWS_ACCESS_SECRET', aws_access_secret)

set_key(envPath, 'AWS_REGION', aws_region)
set_key(envPath, 'AWS_BUCKET_NAME', aws_bucket_name)







