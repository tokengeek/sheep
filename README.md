# Sheep

Sheep is a simple Rack application pretenting to be the API of a Cloud
Computing service provider.

Why Sheep? Well it does what it is told and looks like a cloud until
examined in a big more depth.

It's only real purpose is to give a very simple HTTP API that allows
you to control the response directly from the request which can be
developed against.

    $ curl http://localhost:9292/servers/200.json\?id\=srv-12345
    {"id":"srv-12345"}

    $ curl -i http://localhost:9292/servers/401.xml\?id\=srv-12345
    HTTP/1.1 401 Unauthorized
    Content-Type: application/xml
    Transfer-Encoding: chunked
    Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
    Date: Mon, 12 Nov 2012 22:07:57 GMT
    Content-Length: 86
    Connection: Keep-Alive

    <?xml version="1.0" encoding="UTF-8"?>
    <hash>
      <id>srv-12345</id>
    </hash>

    $ curl -X POST http://localhost:9292/servers/200.json --data "id=srv-12345"
    {"id":"srv-12345"}

At the moment it is super generic but may be tweaked to be like a cloud
provider without getting too complex.

## Installation

    $ git clone https://github.com/tokengeek/sheep
    $ cd sheep
    $ bundle install

The `sheep` gem already exists unfortunately but is a API wrapper around
a seemingly gone social network.

## Usage

Sheep is a Rack application to run locally whilst it pretends to be a
cloud provider.

    $ rackup
    [2012-11-12 22:02:53] INFO  WEBrick 1.3.1
    [2012-11-12 22:02:53] INFO  ruby 1.9.3 (2012-04-20) [x86_64-darwin11.4.2]
    [2012-11-12 22:02:53] INFO  WEBrick::HTTPServer#start: pid=87194 port=9292

Now you make http requests using URLs in the following form:

    http://localhost:9292/{your_reference}/{desired_response_code}.{json,xml}?key=value&other_key=other_value
    http://localhost:9292/get_server/200.json
    http://localhost:9292/bad_authentication/401.xml?reason=checksum_screwy

Then, you build against it!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
