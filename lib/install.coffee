
fs = require 'fs'
exec = require('child_process').exec
request = require 'superagent'
path = require 'path'

#
# Install library from github
#

exports.github = (user, repo, dir, next = ->) ->
  url = "https://github.com/#{user}/#{repo}/archive/master.zip";
  tarball = fs.createWriteStream "/tmp/#{repo}.zip"
  request.get(url).buffer(false).end (res) ->
    if res.error then return next res.error
    res.pipe tarball
    res.on 'end', ->
      cmd = "unzip /tmp/#{repo}.zip -d #{dir}"
      # rename lib directory (e.g: list-master -> list)
      cmd += " && mv #{dir}/#{repo}-master #{dir}/#{repo}"
      # copy lib .h in inc/
      cmd += " && cp #{dir}/#{repo}/lib/#{repo}.h #{dir}/../inc"
      exec cmd, (err) ->
        if err then return next err
        next null

#
# Install library from bitbucket
#

exports.bitbucket = ->
  console.log "Coming soon <3"