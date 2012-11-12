require "rack"
require "active_support/json/encoding"
require "active_support/core_ext/hash/conversions"

# Sheep is a simple Rack application pretenting to be the API of a Cloud
# Computing service provider.
module Sheep
  # Server is a Rack app that pretty much echos back the parameters in
  # either JSON or XML depending on the extension.
  #
  # @example JSON request
  #     $ curl http://localhost:9292/servers/200.json?id=srv-12345
  #     {"id":"srv-12345"}
  #
  # @example XML request
  #     $ curl http://localhost:9292/servers/200.xml?id=srv-12345
  #     <?xml version="1.0" encoding="UTF-8"?>
  #     <hash>
  #       <id>srv-12345</id>
  #     </hash>
  #
  class Server
    # Used by Rack to echo back the details
    def call(env)
      req = Rack::Request.new(env)

      description, response_type, body_type = split_path_to_values(req.path)
      response_they_want = response_type.to_i

      if body_type == "xml"
        [response_they_want, {"Content-Type" => "application/xml"}, [req.params.to_xml]]
      else
        [response_they_want, {"Content-Type" => "application/json"}, [req.params.to_json]]
      end
    end

    # Takes a one level path splits it into three values
    def split_path_to_values(path)
      parts = path.split("/")

      description = parts[1]
      more_parts = parts[2].split(".")

      response_type = more_parts[0]
      body_type = more_parts[1]

      return description, response_type, body_type
    end

  end
end
