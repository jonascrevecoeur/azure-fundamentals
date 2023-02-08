# Azure blob storage

Tasks:
1. Provision an Azure storage account through the Azure portal
2. Create containers named `raw` and `clean` in your Azure storage account via the Azure portal
3. Use the Azure CLI to upload the file `data/example.txt` into the raw container of the storage account
   * Login to Azure using `az login`
   * Select the correct subscription using `az account set --subscription <subscription>`
   * Upload a new file using [`az storage blob upload`](https://learn.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest#az-storage-blob-upload)
   * List all files in the storage account using [`az storage blob list`](https://learn.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest#az-storage-blob-list)
  
4. Move the file `example.txt` from the `raw` container into the `clean` container using the Azure Python SDK
   * Install the `azure-blob-storage` package
   * Write a Python script
     * Authenticate with the storage account using the BlobServiceclient
     * Obtain a reference to the source blob you want to copy
     * Download the content of the source blob into a string variable
     * Obtain a reference to the target blob that we want to create
     * Write the string value from the source blob to the target reference

5. Create a Python script to list all files in the `raw` container
   *  Auehtenticate with your storage account using the BlobServiceclient
   *  Obtain a reference to the container client (https://learn.microsoft.com/en-us/python/api/azure-storage-blob/azure.storage.blob.containerclient?view=azure-python)
   *  List all files (https://learn.microsoft.com/en-us/python/api/azure-storage-blob/azure.storage.blob.containerclient?view=azure-python#azure-storage-blob-containerclient-list-blob-names)