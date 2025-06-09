from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return '''
    <html>
    <head>
        <title>Hello Parthaa</title>
        <style>
            body {
                background-color: #f0f8ff;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
            }
            h1 {
                font-size: 60px;
                color: #2c3e50;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!<br> by Partha 🚀 test </h1>
    </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
