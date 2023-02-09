import logging

import azure.functions as func


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    a = int(req.route_params.get('a'))
    b = int(req.route_params.get('b'))

    return func.HttpResponse(f"The sum of {a} and {b} is {a+b}.")