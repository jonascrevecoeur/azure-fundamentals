functionapp="jcrevecoeur"
rg="jcrevecoeur"

# create and activate a new .env
python3 -m venv .venv
source .venv/bin/activate

# install required packages
pip install -r requirements.txt

# create the basic files for our function app
func init

# Add a function (http trigger) get_time which returns the current time
func new

# Tasks
# 1. write function routine to return the current time
# 2. add `route` in configuration
# 3. set method to `get` 

# run the function function app locally to test the http trigger
func start

# Deploy on Azure
functionapp="jcrevecoeur"
func azure functionapp publish $functionapp

# List the keys for the function app
# when running on Azure you have to pass an API key as  ?code=<API key>
az functionapp keys list \
    --name $functionapp \
    --resource-group $rg

# Add a second function (http trigger) get_sum which returns the sum of the passed parameters a and b
func new

# Tasks
# 1. write function routine to return the current time
# 2. set `route` to "route": "sum/{a}/{b}"

# test the new functionality
func start

# Add a function that returns secrets (used to retrieve the connection string to our storage account)

# 1. Create a key vault
# 2. Add the connection string as a secret

# 3. test that the secret can be retrieved
keyvault="kv-jcrevecoeur"
secret_connection_string="storage-connection-string"
az keyvault secret show --name $secret_connection_string --vault $keyvault

# 4. create a new http trigger that takes a single parameter `key`` and returns the corresponding secret 
func new

# 5. use the Python sdk to retrieve and return the secret
image.png
# test the implementation
func start

# push the app to Azure
func azure functionapp publish $functionapp

# Add a managed identity to function app
# Give this managed identity access to the keyvault

func new
func start

func new
func start

# Use Azurite to test blobstorage triggers locally
npm install -g azurite
azurite

azurite_connection_str="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;"
az storage container create -n raw --connection-string $azurite_connection_str
az storage container create -n clean --connection-string $azurite_connection_str

az storage container list --connection-string $azurite_connection_str

az storage blob list \
    --connection-string $azurite_connection_str \
    --container-name clean

az storage blob upload \
    --connection-string $azurite_connection_str \
    --container-name raw \
    --file host.json \
    --name test2.txt

az storage container list -n clean 

func azure functionapp publish $functionapp

func new

# Add authlevel anonymous
# useMonitor https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-timer?tabs=in-process&pivots=programming-language-python#configuration

func start