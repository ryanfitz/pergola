class Connection < ActiveRecord::Base
  include MongoHelper
  
  validates_presence_of :title, :host, :port
  validates_uniqueness_of :title
  
  validates_numericality_of :port, :only_integer => true
end
