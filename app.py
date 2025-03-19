from flask import Flask, render_template
import os

app = Flask(__name__)

# Only enable debug mode and auto-reloading in development
if os.environ.get('FLASK_ENV') == 'development':
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0  # Disable caching for static files
    app.debug = True
else:
    # Production settings
    app.debug = False
    # You might want to set a secret key for production
    # app.secret_key = os.environ.get('SECRET_KEY', 'default-secret-key')

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/health')
def health():
    return {"status": "healthy"}

if __name__ == '__main__':
    # These settings only apply when running with python app.py
    # In production, we'll use Gunicorn
    app.run(debug=True, host='0.0.0.0', port=5000, use_reloader=True)
