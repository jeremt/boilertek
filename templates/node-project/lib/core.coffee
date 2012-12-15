
# Module dependencies

express = require 'express'
path = require 'path'
fs = require 'fs'

# Load all modules from `opts.path` folder

exports.load = (parent, opts) ->

	opts.verbose and console.header "Load application routes"

	unless fs.existsSync opts.path
		opts.path = __dirname + '/../app'
	routes = require(opts.routes ? __dirname + '/../config/routes')
	first = true

	for name in fs.readdirSync(opts.path)

		opts.verbose and not first and console.log()
		first = false
		opts.verbose and console.log "    \x1b[1m#{name}\x1b[m\n"

		# settings

		root = path.join opts.path, name
		controller = require root
		name ?= controller.name
		controller.prefix ?= ''
		app = express()

		# template `engine`

		if controller.engine
			app.set 'view engine', controller.engine ? 'jade'
		app.set 'views', root + '/views'

		# `before` middleware

		if controller.before
			app.all "/#{name}/*", controller.before
			opts.verbose and console.log "    ALL /#{name}/* -> before"

		for key, value of controller

			method = null
			route = null

			unless ['name', 'prefix', 'engine', 'before'].indexOf(key) is -1
				continue

			for cmp, obj of routes
				if key is cmp
					method = obj.method
					route = '/' + path.join name, obj.route

			unless method
				method = 'get'
			unless route
				route = '/' + path.join name, key

			route = controller.prefix + route
			app[method](route, controller[key])

			opts.verbose and console.log "    #{method.toUpperCase()} #{route} -> #{key}"

		parent.use app