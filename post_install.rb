# -*- encoding : utf-8 -*-
# This file is executed in the Rails evironment by the `rails-post-deploy`
# script

def table_exists?(table)
  ActiveRecord::Base.connection.table_exists?(table)
end

def column_exists?(table, column)
  if table_exists?(table)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end

# Add the address_line field to the User model
unless column_exists?(:users, :address_line)
  migration_file_path = '../db/migrate/add_address_line_to_user'
  require File.expand_path migration_file_path, __FILE__
  AddAddressLineToUser.up
end

# Add the status_flag field to the User model
unless column_exists?(:users, :status_flag)
  migration_file_path = '../db/migrate/add_status_flag_to_user'
  require File.expand_path migration_file_path, __FILE__
  AddStatusFlagToUser.up
end

# Create any necessary global Censor rules
require File.expand_path(File.dirname(__FILE__) + '/lib/censor_rules')
