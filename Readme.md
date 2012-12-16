Boilertek
=========

Boilertek is a generic scafolding tool with some customization options and a frendly command line interface.

Usage
-----

```shell

►   Usage tek [args]

    Simple script to easily generate project skeleton.

►   Options

    -t, --template <name>     The <name> of the template to use
    -o, --output <path>       The <path> to the output directory
    -V, --version             Display version
    -h, --help                Display help
    -l, --libs <l1, l2...>    Load some libraries into your project

```

### boilertek.json

Add a boilertek.json file to easily congure your template. Add data to add some variables, and header to add a header on each file (epitech header supported yet :)). Example :
```json
{
  "header": "epitech",
  "data": {
    "project": "Project ",
    "author": "Author ",
    "mail": "Mail ",
    "description": "Description "
  }
}
```

TODO
----

- Git handling (unit test, version, svn...)
- make install (to install tek binary)
- Fetch libraries from bitbucket

Infos
-----

### remotes
- bitbucket: ssh://git@bitbucket.org/{{git}}/{{repo}}.git
- github: git@github.com:{{git}}/{{repo}}.git

License
-------

(The MIT License)

Copyright (c) 2012 Jeremie T. &lt;taboada.jeremie@gmail.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.