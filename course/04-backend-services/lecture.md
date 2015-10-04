# Backend Services

## Python Code-Along

### Summary

* We introduced the Python language - syntax, arrays, dicts, functions and file structure idioms.
* We setup a local python environment using `brew install python`.
* We setup a docker-ized server stack: NGINX talking to Python's Gunicorn talking to PostgreSQL.

### Resources

* We roughly followed [this tutorial](https://realpython.com/blog/python/dockerizing-flask-with-compose-and-machine-from-localhost-to-the-cloud/), except we did not use the *data container* feature to keep things simple.  Our [docker-compose.yaml](https://cornell-cs5356-2015.slack.com/archives/general/p1442433322000065) is in slack
* [Flask](http://flask.pocoo.org/) is a good Python framework with easy-to-understand routing and simple idioms that makes it easy to specify your API in terms of paths and the REST vocabulary (GET, PUT, POST, DELETE).
* Hat-tip to Tim for the great tutorial for [Building a RESTful API in Flask](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask) and this Flask-based [HOW-TO guide](https://realpython.com/blog/categories/flask/) cover things like authentication and much more.

### Homework

* Earn your first point for _last week's_ homework by pasting your story into your teams github project page -or- linking from the github project page to the story in your project management system, like [waffle.io](waffle.io) or Trello.
* _Every Team_ will present their story Demo next Weds.  *Maximum presentation time is 3-mins per team!* detailed instructions for the format of your presentation to follow.
