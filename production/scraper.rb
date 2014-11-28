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
      @page = mechanize.get(req.params["url"])

      url = req.params["url"]

      if @page.at('meta[@property="og:title"]').nil?
        title = @page.title
      else
        title = @page.at('meta[@property="og:title"]')[:content]
      end

      if @page.at('meta[@property="og:site_name"]').nil?
        site_name = @page.title
      else
        site_name = @page.at('meta[@property="og:site_name"]')[:content]
      end

      if @page.at('meta[@property="og:description"]').nil?
        if @page.at('meta[@property="description"]').nil?
          description = ""
        else
          description = @page.at('meta[@property="description"]')[:content]
        end
      else
        description = @page.at('meta[@property="og:description"]')[:content]
      end

      if @page.at('meta[@property="og:image"]').nil?
        image = ""
      else
        image = @page.at('meta[@property="og:image"]')[:content]
      end
    end

    [
      200,
      {
        'Content-Type'  => 'application/json',
        'Access-Control-Allow-Origin' => 'http://localhost:3000'
      },
      [
        {
          "url" => url,
          "title" => title,
          "name" => site_name,
          "description" => description,
          "image" => image
        }.to_json
      ]
    ]
  end
end
