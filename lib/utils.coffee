
# Module dependencies

fs = require 'fs'
path = require 'path'

# Read get all file in `dir`

exports.walk = (dir, cb) ->
  results = []
  fs.readdir dir, (err, list) ->
    if err then return cb err
    pending = list.length
    unless pending then return cb null, results
    list.forEach (file) ->
      file = dir + '/' + file
      fs.stat file, (err, stat) ->
        if stat and stat.isDirectory()
          exports.walk file, (err, res) ->
            results = results.concat(res)
            unless --pending then return cb null, results
        else
          results.push file
          unless --pending then return cb null, results

# Write in the file and create parents when doesnt exists

exports.fwrite = (pathname, data, cb = ->) ->
  dirname = path.dirname pathname

  unless dirname
    return fs.writeFile pathname, data, cb
  exports.mkdirs dirname, ->
    fs.writeFile pathname, data, cb

# Recursively creates the parent directories when they don't exist

exports.mkdirs = (pathname, cb = ->) ->
  fs.mkdir pathname, 0o0755, (error) ->
    if error and error.errno is 34
      exports.mkdirs path.dirname(pathname), cb
      exports.mkdirs pathname, cb
    cb()