class ApplicationRecord < ActiveRecord::Base
  require 'my_payjp.rb'
  self.abstract_class = true
end
