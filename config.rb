###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
   blog.prefix = "posts"
   blog.permalink = ":year/:month/:day/:title.html"
   blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
   blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
   blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

activate :directory_indexes
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-44597164-1'
end

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

configure :build do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-44597164-1'
  end
end

page "/feed.xml", :layout => false

# ignore compiled css
ignore "/stylesheets/containers.css"
ignore "/stylesheets/footer.css"
ignore "/stylesheets/header.css"
ignore "/stylesheets/normalize.css"
ignore "/stylesheets/post.css"
#
line_comments=false
#
# ###
# # Compass
# ###
#
# # Change Compass configuration
compass_config do |config|
   config.output_style = :expanded
     # config.sass_options = {line_numbers: false, line_comments: false}
end
#
### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

set :haml, :format => :html5

set :css_dir, 'stylesheets'

# set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :syntax,
         :linenos => 'inline',
         :anchorlinenos => true,
         :linenostart => 2

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
  set :http_path, "/Content/images/"
end
