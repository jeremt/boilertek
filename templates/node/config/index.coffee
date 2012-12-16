
# Module dependencies

express = require 'express'
pkg = require '../package'

module.exports = (app) ->

	# Simple helper to display headers

	console.header = (msg) ->
		@log "\n\x1b[1m  " + msg + "\x1b[m\n"

	# Configure express application

	app.configure ->

		@use express.static __dirname + '../public'
		@use express.bodyParser()

		@set 'title', pkg.name

		@set 'views', __dirname + '../views'
		@set 'view engine', 'jade'