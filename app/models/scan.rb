class Scan < ActiveRecord::Base
  belongs_to :campaign
  
  validates_uniqueness_of :code
  
  def self.get_campaign(body)
    return body
  end
end
