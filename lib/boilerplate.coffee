
#
# Module dependencies
#

fs = require 'fs'
path = require 'path'
utils = require './utils'
header = require './header'

#
# Boilerplate class
#

module.exports = class Boilerplate

	#
	# Initialize the boilerplate with a `template`
	# and the `path` of the output directory
	#

	constructor: (@template, @path) ->
		unless @template and @path
			throw new TypeError "`template` and `path` must be defined."

		fs.mkdirSync @path, 0o0775

	#
	# Configure the project from the `boilertek.json` config file
	#

	configure: (next) ->

		unless fs.existsSync @template + '/boilertek.json'
			return next []

		config = require @template + '/boilertek'

		keys = Object.keys config.data
		values = {}

		_prompt = (msg, cb) ->
			process.stdout.write "  \x1b[1m#{msg}\x1b[m"
			process.stdin.setEncoding 'utf8'
			process.stdin.once('data', cb).resume()

		_configure = =>
			key = keys.shift()
			if key
				_prompt config.data[key], (value) ->
					values[key] = value.trim()
					_configure()
			else
				process.stdin.destroy()
				next header: config.header, values: values

		_configure()

	#
	# Generate the boilerplate
	#

	generate: ->
		@configure (config) =>
			utils.walk @template, (err, files) =>
				if err then throw err
				for file in files
					continue if path.basename(file) is 'boilertek.json'
					content = fs.readFileSync file, 'utf8'
					# get file type
					if path.basename(file).toLowerCase() is 'makefile'
						ext = 'makefile'
					else
						ext = path.extname(file).substr(1)
						if ext is 'h' then ext = 'c'
						if ext in ['md', 'json'] then ext = ''
					# replacing data
					for key, value of config.values
						regexp = new RegExp "{{#{key}}}", 'g'
						file = file.replace regexp, value
						content = content.replace regexp, value
					file = file.substring @template.length
					# add header
					if ext and config.header and config.header is "epitech"
						basename = path.basename @path + file, content
						dirname = path.dirname @path + file, content
						content = """
						#{header(
							basename
							config.values.project
							ext
							path.join process.env.PWD, dirname
						)}
						#{content}
						"""

					utils.fwrite @path + file, content
