from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <h1>Jay Rathod - Cloud Portfolio</h1>
    <p>Deployed with Docker, Terraform & GitHub Actions</p>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)