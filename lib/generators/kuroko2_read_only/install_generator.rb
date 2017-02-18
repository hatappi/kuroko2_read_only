require "rails/generators"
require "rails/generators/active_record"

module Kuroko2ReadOnly
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    class_option(
      :user_table_name,
      type: :string,
      default: 'users',
      desc: 'If kuroko2 user table name change'
    )

    class_option(
      :default_read_only,
      type: :boolean,
      default: true,
      desc: 'default read_only boolean value'
    )

    source_root File.expand_path('../templates', __FILE__)

    def create_migration_file
      template_name = 'add_read_only_column_to_users.kuroko2.rb'
      migration_template template_name, "db/migrate/#{template_name}"
    end

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end
