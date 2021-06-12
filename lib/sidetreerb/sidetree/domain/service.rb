

module Sidetreerb
  module Sidetree
    class Service

      def initilize(id: "serviceId123", type: "someType", service_endpoint: "https://www.url.com")
        @id = id
        @type = type
        @service_endpoint = service_endpoint
      end

      def export_json
        {id: id, type: type, service_endpoint: service_endpoint}.to_json
      end

    end
  end
end
