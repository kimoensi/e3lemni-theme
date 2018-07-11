# -*- encoding : utf-8 -*-
class AddAddressLineToUser < ActiveRecord::Migration
  def self.up
    #address_line uses a text column to support full addresses
    add_column :users, :address_line, :text, :null => true
  end

  def self.down
    remove_column :users, :address_line
  end
end
