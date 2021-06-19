module Sidetreerb
  module Cas
    autoload :Ipfs, 'sidetreerb/cas/ipfs'
    autoload :Swarm, 'sidetreerb/cas/swarm'

    class << self 

      def configure(config)
        case config[:cas][:type]
        when 'ipfs'

        when 'swarm'
          raise 'implementing...'
        else
          raise Error::Cas::NotImplemnted
        end
      end

    end
    
    private

    def cas_adapter
      self.class.cas_adapter
    end

  end
end