#!/usr/bin/python
import time
import socket
import flask

app = flask.Flask(__name__)

START = time.time()

BIND_PARAMETERS = {
    'HOST': "0.0.0.0",
    'PORT': 9999
}


def elapsed():
    running = time.time() - START
    minutes, seconds = divmod(running, 60)
    hours, minutes = divmod(minutes, 60)
    return "%d:%02d:%02d" % (hours, minutes, seconds)


@app.route('/')
def root():
    request_headers = "".join(["<tr><td style='background:#5a5c5f; padding:6px;'>{}</td><td style='background:#565365; padding:6px;'>{}</td></tr>".format(
        header_name, header_value) for (header_name, header_value) in flask.request.headers.items()])
    host = "[HOST: {}] (uptime: {})]".format(socket.gethostname(), elapsed())
    response_body = "Hello Universe"
    style = """
    width: 800px;
    margin: 0 auto;
    font-family: sans-serif;
    margin-top: 40px;
    background: #3f3f4a;
    color: #FFF;
    """
    response = "<title>Hello Universe</title><body style='{}'><h3>Request Headers</h3><table>{}</table><hr/><h3>Response from {} </h3><div style='font-size:20px;border: 1px solid #d4d3d9; padding: 20px;'>{}</div></body>".format(
        style.replace("\n", " "), request_headers, host, response_body)
    return response


if __name__ == "__main__":
    app.run(
        debug=True, host=BIND_PARAMETERS['HOST'], port=BIND_PARAMETERS['PORT'])
