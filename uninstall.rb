# -*- encoding : utf-8 -*-
# Uninstall hook code here

def table_exists?(table)
  ActiveRecord::Base.connection.table_exists?(table)
end

def column_exists?(table, column)
  if table_exists?(table)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end

if ENV['REMOVE_MIGRATIONS']
  # Remove the address_line field from the User model
  if column_exists?(:users, :address_line)
    migration_file_path = '../db/migrate/add_address_line_to_user'
    require File.expand_path migration_file_path, __FILE__
    AddAddressLineToUser.down
  end

  # Remove the status_flag field from the User model
  if column_exists?(:users, :status_flag)
    migration_file_path = '../db/migrate/add_status_flag_to_user'
    require File.expand_path migration_file_path, __FILE__
    AddStatusFlagToUser.down
  end
    
end
