module Sidetreerb
  module Cas
    class Ipfs
      attr_reader :host, :port, :uri

      def initialize(host:, port:)
        @uri = URI.join(host, port)
      end

      def write(content)
        requestBody = {  }
        header = { "Content-Type" => "multipart/form-data; boundary=#{multipartBoundaryString}" }
        
        endpoint_uri = URI.join(uri, "/api/v0/cat?arg=#{base58Multihash}&length=#{maxSizeInBytes + 1}")
        response = http.post(endpoint_uri, requestBody, header)

        validate_response(response)
      end

      def read(cas_uri)
        validate_cas_uri(cas_uri)

        requestBody = {  }
        header = { "Content-Type" => "multipart/form-data; boundary=#{multipartBoundaryString}" }

        endpoint_uri = URI.join(uri, "/api/v0/cat?arg=#{cas_uri}&length=#{maxSizeInBytes + 1}")
        response = http.post(endpoint_uri, requestBody, header)

        validate_response(response)
        response.body
      end

      private

      def validate_response(response)

      end

      def validate_cas_uri(cas_uri)

      end

    end
  end
end