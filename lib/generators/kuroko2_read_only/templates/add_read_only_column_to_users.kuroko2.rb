class AddReadOnlyColumnToUsers < ActiveRecord::Migration
  def change
    add_column :<%= @options['user_table_name'] %>, :read_only, :boolean, default: <%= @options['default_read_only'] %>
  end
end