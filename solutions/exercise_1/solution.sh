subscription="Azure cursus"
storage_account="jcrevecoeur"

# Read the access key from the .env file, which is not committed to git 
export $(grep -v '^#' .env | xargs -d '\n')

az login
az account set --subscription "$subscription"

# upload the file
az storage blob upload \
    --account-name $storage_account \
    --account-key $account_key \
    --container-name raw \
    --file data/example.txt \
    --name example.txt

# list all files in the container
az storage blob list \
    --account-name $storage_account \
    --account-key $account_key \
    --container-name raw 

# move the file to the clean container using the python sdk

# 1. create a virtual environment for storing python packages
python3 -m venv .venv

# 2. activate the virtual environment
source .venv/bin/activate

# 3. install required libraries
pip install azure-storage-blob
pip install python-dotenv

# 4. run the python script to copy the file
# we are actually downloading its content and creating a new blob with the same content
# Copying a blob directly is more complicated
python3 copy_file.py