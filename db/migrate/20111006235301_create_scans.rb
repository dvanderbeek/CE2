class CreateScans < ActiveRecord::Migration
  def self.up
    create_table :scans do |t|
      t.integer :campaign_id
      t.string :email
      t.integer :num_scans
      t.integer :code
      t.boolean :redeemed, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :scans
  end
end
