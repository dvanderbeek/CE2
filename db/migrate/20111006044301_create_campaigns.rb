class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.integer :user_id
      t.string :offer
      t.string :email_subject
      t.string :email_body
      t.string :thanks
      t.string :bitly

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
