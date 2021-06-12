# frozen_string_literal: true

require_relative "sidetreerb/version"
require "bitcoin"


module Sidetreerb
  autoload :Blockchain, 'sidetreerb/blockchain'
  autoload :Cas, 'sidetreerb/cas'
  autoload :DB, 'sidetreerb/db'
  autoload :Sidetree, 'sidetreerb/sidetree'
end
