from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'E num é que funciona!?'

if __name__ == '__main__':
    app.run(port=5000)
