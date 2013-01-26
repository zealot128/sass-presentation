# Reveal.js middleman template

Making presentation in the awesome reveal.js slide framework.
Compiled to use with middleman pipeline:

* Haml
* Sass
* Coffeescript
* reveal.js ready to use



## Usage


Download:
```
git clone THIS my-awesome-presentation
cd THIS
rm -rf .git
git init
```

Bootstrap:

```
bundle
middleman watch
```

``middleman build`` for static site built.

just edit index.html.haml for presentation

Change theme inside ``javascripts/all.js:9``


