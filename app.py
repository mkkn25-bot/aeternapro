from flask import Flask, jsonify, render_template

app = Flask(__name__)

@app.route('/')
@app.route('/')
def home():
    return render_template('index.html')

@app.route('/api/status')
def status():
    return jsonify({"message": "Hello from Aeterna Backend", "status": "active"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
