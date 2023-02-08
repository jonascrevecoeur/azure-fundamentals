
from azure.storage.blob import BlobServiceClient, ContainerClient
from dotenv import load_dotenv
import os

load_dotenv()

blob_service:BlobServiceClient = BlobServiceClient.from_connection_string(os.environ.get('connection_string'))

raw_container_service:ContainerClient = blob_service.get_container_client('raw')

list(raw_container_service.list_blob_names())