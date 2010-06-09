class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.string :title, :null => false
      t.string :username
      t.string :password
      t.string :host, :default => 'localhost', :null => false
      t.integer :port, :default => 27017, :null => false
    end
  end

  def self.down
    drop_table :connections
  end
end
