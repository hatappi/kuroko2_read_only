class AddReadOnlyColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :read_only, :boolean, default: <%= @options['default_read_only'] %>
  end
end