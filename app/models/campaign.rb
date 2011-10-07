class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :scans
  
  attr_accessible :offer, :email_subject, :email_body, :thanks, :bitly
end
