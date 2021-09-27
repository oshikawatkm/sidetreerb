# require 'net/http'
# require 'json/pure'

# module Sidetreerb
#   module Blockchain
#     module Bitcoind
#       class BitcoinCoreClient

#         attr_reader :schema, :host, :port, :user, :password

#         def initialize(config)
#           @schema = config[:schema]
#           @host = config[:host]
#           @port = config[:port]
#           @user = config[:user]
#           @password = config[:password]
#         end

#         private

#         def server_url 
#           url = "#{schema}://#{user}:#{password}@#{host}:#{port}"
#           # if !config[:wallet].nil? && !config[:wallet].empty?
#           #   url 
#           # end
#         end

#         def request(command, *params)
#           data = {
#             :method => command
#             :params => params,
#             :id => 'jsonrpc'
#           }
#           uri = URI.parse(server_url)
#           http = Net::HTTP.new(uri.hostname, uri.port)
#           http.use_ssl = uri.scheme === "https"
#           request = Net::HTTP::Post.new(uri.path.empty? ? '/' : uri.path)
#           request.basic_auth(uri.user, uri.password)
#           request.content_type = 'application/json'
#           request.body = data.to_json
#           response = http.request(request)
#           body = response.body
#           response = Bitcoin::Ext::JsonParser.new(body.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*').encode('ISO-8859-1').force_encoding('UTF-8') }).parse
#           raise response['error'].to_json if response['error']
#           response['result']
#         end
#       end
#     end
#   end
# end