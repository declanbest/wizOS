# app/main.py

from flask import Flask

# Create an instance of the Flask class
app = Flask(__name__)

@app.route("/")
def hello_world():
    """
    This function is triggered when a user visits the root URL ('/').
    It returns a simple greeting string.
    """
    return "<h1 style='font-family: sans-serif; text-align: center; padding-top: 2rem;'>Hello from Docker! 👋</h1>"

if __name__ == "__main__":
    # This block runs the app.
    # host='0.0.0.0' makes the server accessible from outside the container.
    # port=5000 is the standard port for Flask development.
    app.run(host='0.0.0.0', port=5000)

