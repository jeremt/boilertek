#
# WHY CAN'T GET THIS!
#

process.env.USER_NICKNAME = 'jeremie taboada-alvarez'

#
# Comments according languages
#

comments =
	js:  			{begin: '/**', middle: ' *', end: ' */'}
	coffee:  	{begin: '#', middle: '#', end: '#'}
	c: 				{begin: '/*', middle: '**', end: '*/'}
	css: 			{begin: '/*', middle: '**', end: '*/'}
	cpp:  		{begin: '//', middle: '//', end: '//'}
	pov:  		{begin: '//', middle: '//', end: '//'}
	java: 		{begin: '//', middle: '//', end: '//'}
	latext: 	{begin: '%%', middle: '%%', end: '%%'}
	lisp: 		{begin: ';;', middle: ';;', end: ';;'}
	xdefault: {begin: '!!', middle: '!!', end: '!!'}
	pascal: 	{begin: '{ ', middle: '   ', end: '}'}
	makefile: {begin: '##', middle: '##', end: '##'}
	html: 		{begin: '<!--', middle: '--', end: '-->'}

#
# Epitech mail format
#

mail = (domain = 'epitech.net') ->
	"<#{process.env['USER']}@#{domain}>"

#
# Epitech date format
#

date = ->
	d = new Date().toString().split ' '
	[d[0], d[1], d[2], d[4], d[3]].join ' '

#
# Expose header generation
#

module.exports = (file, project = '', language = 'c', path = 'process.env.PWD') ->
	comment = comments[language]
	fullname = process.env.USER_NICKNAME

	# Header generation according language

	"""
	#{comment.begin}
	#{comment.middle} #{file} for #{project} in #{path}
	#{comment.middle}
	#{comment.middle} Made by #{fullname}
	#{comment.middle} Login   #{mail()}
	#{comment.middle}
	#{comment.middle} Started on  #{date()} #{fullname}
	#{comment.middle} Last update #{date()} #{fullname}
	#{comment.end}
	"""