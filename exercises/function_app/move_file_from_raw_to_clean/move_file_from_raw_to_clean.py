import logging

import azure.functions as func

def main(inputblob: func.InputStream, outputblob: func.Out[str]):
    logging.info(f"Python blob trigger function processed blob \n"
                 f"Name: {inputblob.name}\n"
                 f"Blob Size: {inputblob.length} bytes")
    
    outputblob.set(inputblob.read().decode('utf-8'))