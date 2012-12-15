
# The routes config <- a revoir
# `route` is the route name by default
# `method` is 'get' by default

module.exports =
	index:
		route: '/'
	show:
		route: '/:name'
	list:
		route: '/list'
	edit:
		route: '/edit'
	update:
		method: 'put'
		route: '/:name'
	create:
		method: 'post'
		route: '/'