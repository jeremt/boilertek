
exports.index = (req, res) ->
	res.send "Hello world!"

exports.create = (req, res) ->
	res.send "Create!"

exports.show = (req, res) ->
	res.send "Hello, #{req.params.name}!"

exports.update = (req, res) ->
	res.send "Update #{req.params.name}!"

exports.search = (req, res) ->
	res.send 'Perform search!'