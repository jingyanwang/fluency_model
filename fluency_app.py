from flask import render_template
from flask import request
from flask import url_for
from flask import Flask

from markupsafe import escape

from spanish_fluence import fluence_scoring


app = Flask(
    __name__
    )


@app.route(
	'/fluence',
	methods = [
		'POST',
		'GET',
		])

def fluence():
	if request.method == 'POST':
		input_text = request.form['input_text']

		score = fluence_scoring(
			input_text,
			)

		score = f'{score:0.4f}'

		return render_template(
			"index.html",
			score = score,
			input_text = input_text,
			)
	else:
		return render_template(
			"index.html")


'''

# start the service

cd /fluence_model

flask --app fluency_app --debug run --host=0.0.0.0 --port=6744

localhost:6744/fluence


'''