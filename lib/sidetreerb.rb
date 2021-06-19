# frozen_string_literal: true

require_relative "sidetreerb/version"
require "bitcoin"

module Sidetreerb
  autoload :Blockchain, 'sidetreerb/blockchain'
  autoload :Cas, 'sidetreerb/cas'
  autoload :DB, 'sidetreerb/db'
  autoload :Sidetree, 'sidetreerb/sidetree'

  begin
    class Railtie < ::Rails::Railtie
      rake_tasks do 
        load "tasks/sidetreerb/batch_writer.rake"
      end
    end
  rescue => exception
    puts "Paketask is unavailable"
  end
end
