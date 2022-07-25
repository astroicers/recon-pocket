from flask import Flask
from os.path import exists
import sys

app = Flask(__name__)

@app.route('/')
def hello_world():
    def chk(filename):
        n = "/treasure/%s/done.txt" %(filename)
        if exists(n):
            return "%s is done!<br>" %(filename)
        else:
            return "%s is running<br>"%(filename)

    def body():
        body = ""
        body += chk("amass")
        body += chk("sublist3r")
        body += chk("subfinder")
        body += chk("assetfinder")
        body += chk("altdns")
        return body

    target = sys.argv[1]
    body = body()
    index = f'''
        <html>
            <head>
                <meta http-equiv="refresh" content="5">
                <title>{target}</title>
            </head>
            <body>{body}</body>
        </html>
        '''
    return index


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=7788)