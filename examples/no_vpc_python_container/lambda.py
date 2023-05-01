##!/usr/bin/python3

import requests
import json

def handler(event, context):
    r = requests.get('https://httpbin.org/headers')
    b = {
        "statusCode": 200,
        "body": json.dumps(json.loads(r.text), indent=2)
    }
    return b
