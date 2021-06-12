module Sidetree
  module InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def create_initializer_file
      template "initilizer.rb.erb", "config/initilizers/sidetree.rb"
    end
  end
end