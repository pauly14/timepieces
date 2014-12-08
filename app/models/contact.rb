class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :mobile, :name
end
