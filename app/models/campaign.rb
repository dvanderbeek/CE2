class Campaign < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :offer, :email_subject, :email_body, :thanks, :bitly
end
