# -*- encoding : utf-8 -*-
class AddStatusFlagToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :status_flag, :string, :null => true
  end

  def self.down
    remove_column :users, :status_flag
  end
end
