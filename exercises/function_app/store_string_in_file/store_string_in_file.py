import logging

import azure.functions as func
from azure.storage.blob import BlobServiceClient, BlobClient
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

def main(req: func.HttpRequest) -> func.HttpResponse:
    file = req.route_params.get('file')
    string = req.route_params.get('string')

    key_vault_name = "kv-jcrevecoeur"
    key_vault_uri = f"https://{key_vault_name}.vault.azure.net"
    connection_string_secret = "storage-connection-string"

    credential = DefaultAzureCredential()
    keyvault = SecretClient(vault_url=key_vault_uri, credential=credential)

    connection_string = keyvault.get_secret(connection_string_secret).value

    blob_service:BlobServiceClient = BlobServiceClient.from_connection_string(connection_string)

    destination:BlobClient = blob_service.get_blob_client(container='raw', blob=file)

    destination.upload_blob(string, overwrite=True)

    return func.HttpResponse(f"File created succesfully")