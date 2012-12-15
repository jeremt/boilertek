
# Module dependencies

express = require 'express'
mongoose = require 'mongoose'
pkg = require './package'
core = require './lib/core'

# Init mongoose

mongoose.connect 'mongodb://localhost:27017/{{project}}'

# Init application

app = express()

opts =
	path: __dirname + '/app'
	verbose: true

# Configure application

require('./config')(app)

# Load modules

core.load app, opts

# Start server on `port`

console.header "Start server"
port = 4242

app.listen port, ->
	infos =
		name: pkg.name
		version: pkg.version
		host: 'localhost'
		port: port
	console.log "    #{key} -> #{value}" for key, value of infos