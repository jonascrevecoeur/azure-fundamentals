from azure.storage.blob import BlobServiceClient, BlobClient
from dotenv import load_dotenv
import os

load_dotenv()

blob_service:BlobServiceClient = BlobServiceClient.from_connection_string(os.environ.get('connection_string'))

source_blob:BlobClient = blob_service.get_blob_client(container='raw', blob='example.txt')
target_blob:BlobClient = blob_service.get_blob_client(container='clean', blob='example.txt')

content = source_blob.download_blob().readall()
target_blob.upload_blob(content, overwrite=True)