
require "fileutils"

desc "Refresh 3rd party assets"
task :copy_assets do
  sh "git submodule init && git submodule update"
  cp "vendor/highlight.js/src/highlight.js", "source/javascripts/highlight.js"
  cp_r "vendor/highlight.js/src/languages/", "source/javascripts/languages"
  cp_r "vendor/highlight.js/src/styles", "source/stylesheets/syntax-styles"

end
