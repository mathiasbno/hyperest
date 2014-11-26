require './scraper'

use Rack::Static,
  :urls => ["/templates", "/script", "/css"],
  :root => "public"

map "/" do
  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/application.html', File::RDONLY)
    ]
  }
end

map '/scrape' do
  run Scraper.new
end
