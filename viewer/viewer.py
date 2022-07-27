from os import chdir
from flask import Flask
from os.path import exists
import sys

app = Flask(__name__)

@app.route('/healthcheck')
def healthcheck():
    return 'OK'

@app.route('/')
def subdomain_page():
    subdomain_funcs = ["amass","sublist3r","subfinder","assetfinder","altdns"]
    
    def chk(filename):
        n = "/treasure/%s/done.txt" %(filename)
        if exists(n):
            return "%s is done!<br>" %(filename)
        else:
            return "%s is running<br>"%(filename)

    def subdomain_chk():
        body = ""
        for subdomain_func in subdomain_funcs:
            body += chk(subdomain_func)
        return body

    target = sys.argv[1]
    subdomain_chk = subdomain_chk()
    index = f'''
        <html>
            <head>
                <meta http-equiv="refresh" content="5">
                <title>{target}</title>
            </head>
            <body>{subdomain_chk}</body>
        </html>
        '''
    return index


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=7788)