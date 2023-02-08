import azure.functions as func
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

def main(req: func.HttpRequest) -> func.HttpResponse:
    secret = req.route_params.get('secret')

    key_vault_name = "kv-jcrevecoeur"
    key_vault_uri = f"https://{key_vault_name}.vault.azure.net"

    credential = DefaultAzureCredential()
    client = SecretClient(vault_url=key_vault_uri, credential=credential)

    secret = client.get_secret(secret).value

    return func.HttpResponse(secret, status_code=200)