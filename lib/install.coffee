
fs = require 'fs'
exec = require('child_process').exec
request = require 'superagent'
path = require 'path'

module.exports = (user, repo, dir, next = ->) ->
  url = "https://github.com/#{user}/#{repo}/archive/master.zip";
  tarball = fs.createWriteStream "/tmp/#{repo}.zip"
  request.get(url).buffer(false).end (res) ->
    if res.error then return next res.error
    res.pipe tarball
    res.on 'end', ->
      exec "unzip /tmp/#{repo}.zip -d #{dir}", (err) ->
        if err then return next err
        next null