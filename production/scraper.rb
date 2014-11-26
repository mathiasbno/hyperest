require 'rack/request'
require 'rack/response'
require 'mechanize'
require 'uri'

class Scraper
  def call(env)
    req = Rack::Request.new(env)
    req.get?
    url_params = req.params["url"]

    puts "URL: #{url_params}"

    if url_params =~ URI::regexp
      mechanize = Mechanize.new
      page = mechanize.get(req.params["url"])
    end

    [
      200,
      {
        'Content-Type'  => 'application/json'
      },
      [
        {
          :url => page.at('meta[@property="og:url"]')[:content],
          :title => page.at('meta[@property="og:title"]')[:content],
          :name => page.at('meta[@property="og:site_name"]')[:content],
          :description => page.at('meta[@property="og:description"]')[:content],
          :image => page.at('meta[@property="og:image"]')[:content]
        }.to_json
      ]
    ]
  end
end
