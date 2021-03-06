module Rack
  # The Rack::TryStatic middleware delegates requests to Rack::Static middleware
  # trying to match a static file
  #     
  # Examples

  # use Rack::TryStatic,
  # :root => "public",  # static files root dir
  # :urls => %w[/],     # match all requests
  # :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

  # uses same options as Rack::Static with extra :try option which is an array
  # of postfixes to find desired file
  class TryStatic

    def initialize(app, options)
      @app = app
      @try = ['', *options[:try]]
      @static = ::Rack::Static.new(
        lambda { |_| [404, {}, []] },
        options)
    end

    def call(env)
      orig_path = env['PATH_INFO']
      found = nil
      @try.each do |path|
        resp = @static.call(env.merge!({'PATH_INFO' => orig_path + path}))
        break if 404 != resp[0] && found = resp
      end
      found or @app.call(env.merge!('PATH_INFO' => orig_path))
    end
  end
end

use Rack::Deflater
use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

run lambda{ |env|
  not_found_page = File.expand_path("../build/404.html", __FILE__)
  if File.exist?(not_found_page)
    [ 404, { 'Content-Type'  => 'text/html'}, [File.read(not_found_page)] ]
  else
    [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ]
  end
}
