###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end
# Haml::Template.options[:ugly] = true

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  def exec_cmd(cmd, text)
    require "open3"
    result = nil, error =nil
    Open3.popen3(cmd) do |stdin,stdout,stderr,wait|
      stdin.puts text
      stdin.close
      result = stdout.read
      error = stderr.read
    end
    if error.present?
      puts error
      raise Exception.new(error)
    end
    result
  end
  def iframe(url, style="")
    "<iframe src='#{url}' width='800' height='600' border='0' style='#{style}'></iframe>"
  end

  def fragment_cache(ident, &block)
    require "digest"
    filename = ".cache/" + Digest::MD5.hexdigest(ident) + ".txt"
    if File.exists? filename
      return IO.read(filename)
    end
    result = yield
    FileUtils.mkdir_p(".cache")
    File.open(filename,"w+") {|f| f.write(result)}
    result
  end

  def pygmentize(lexer,text=nil,&block)
    if block_given?
      text = capture_haml do
        yield
      end
    end
    fragment_cache text do
      exec_cmd("pygmentize -f html -l #{lexer}", text).gsub '<pre>    <span', "<pre><span"
    end
  end

  def scss_and_css(style="expanded",&block)
    text = capture_haml do
      yield
    end
    fragment_cache text do
      css = exec_cmd("cd source && scss --compass --trace -t #{style}", text)
      scss = pygmentize("scss",text).strip
      css = pygmentize("css",css).strip
      "<div class='scss'>Scss #{scss} </div><div class='css'>Css #{css} </div>"
    end
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
