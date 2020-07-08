#!/usr/bin/python3

import requests
import json

def main():
    r = requests.get('https://httpbin.org/headers')
    print(json.dumps(json.loads(r.text), indent=2))

def handler(event, context):
    main()

if __name__ == "__main__":
    main()
