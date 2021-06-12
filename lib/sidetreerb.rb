# frozen_string_literal: true

require_relative "sidetreerb/version"

module Sidetreerb
  autoload :Blockchain, 'sidetreerb/blockchain'
  autoload :Cas, 'sidetreerb/cas'
  autoload :DB, 'sidetreerb/db'
  autoload :Sidetee, 'sidetreerb/sidetree'
end
