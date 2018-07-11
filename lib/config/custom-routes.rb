# -*- encoding : utf-8 -*-
# Here you can override or add to the pages in the core website

Rails.application.routes.draw do

  match '/profile/address_line/edit' => 'address_line#edit',
        :as => :user_edit_address_line,
        :via => :get


  patch '/address_line' => 'address_line#update'
  
end
