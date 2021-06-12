module Sidetree
  module Blockchain

    class << self
        
      def configure(config)
        case config[:blockchain][:type]
        when 'bitcoin'
          Sidetree::Blockchain.blockchain_adapter = Sidetree::Blockchain::Bitcoind.new(config)
        when 'litecoin'
          raise 'implementing...'
        else
          raise Error::Blockchain::NotImplemnted
        end
      end

    end

    private

    def blockchain_adapter
      self.class.blockchain_adapter
    end

  end
end