module Sidetreerb
  module Blockchain
    class Bitcoind
      autoload :Wallet, 'sidetreerb/blockchain/bitcoin/wallet'
      autoload :TxBuilder, 'sidetreerb/blockchain/bitcoin/tx_builder'
      autoload :BitcoinCore, 'sidetreerb/blockchain/bitcoin/bitcoin_core'
      autoload :RPC, 'sidetreerb/blockchain/bitcoin/rpc'

      attr_reader :wallet, :tx_builder, :client

      def initialize(config)
        @wallet = Wallet.new(config)
        # @tx_builder = TxBuilder.new(config[:])
        @client = BitcoinCore.new(config)
      end

    end
  end
end