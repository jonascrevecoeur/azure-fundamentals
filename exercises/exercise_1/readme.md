# Azure blob storage

Tasks:
1. Provision an Azure storage account through the Azure portal
2. Create containers named `raw` and `clean` in your Azure storage account via the Azure portal
3. Use the Azure CLI to upload the file `data/example.txt` into the raw container of the storage account
4. Move the file `example.txt` from the `raw` container into the `clean` container using the Azure Python SDK

## Step 3 - Azure CLI

1. Login to Azure using `az login`
2. Select the correct subscription using `az account set --subscription <subscription>`
3. Upload a new file using [`az storage blob upload`](https://learn.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest#az-storage-blob-upload)
4. List all files in the storage account using [`az storage blob directory list`](https://learn.microsoft.com/en-us/cli/azure/storage/blob/directory?view=azure-cli-latest#az-storage-blob-directory-list)