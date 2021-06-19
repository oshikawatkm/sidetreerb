module Glueby
  module Contract
    class OperationGenerator < Rails::Generators::Base
      include ::Rails::Generators::Migration
      include Glueby::Generator::MigrateGenerator
      extend Glueby::Generator::MigrateGenerator::ClassMethod

      source_root File.expand_path('templates', __dir__)

      def create_migration_file
        migration_dir = File.expand_path("db/migrate")

        if self.class.migration_exists?(migration_dir, "operation_token")
          ::Kernel.warn "Migration already exists: operation_token"
        else
          migration_template(
            "operation_table.rb.erb",
            "db/migrate/operation_token.rb",
            migration_version: migration_version,
            table_options: table_options,
          )
        end
      end
    end
  end
end
