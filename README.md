# Reveal.js middleman template

Making presentation in the awesome reveal.js slide framework.
Compiled to use with middleman pipeline:

* Haml
* Sass
* Coffeescript
* reveal.js ready to use
* Syntax HL with google prettify



## Usage


Download:
```
git clone THIS my-awesome-presentation
cd THIS
git submodule init && git submodule update
```

Bootstrap:

```
bundle
rake copy_assets
middleman
```

``middleman build`` for static site built.

just edit index.html.haml for presentation

Change theme inside ``javascripts/all.js:9``


