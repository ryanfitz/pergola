class Connection < ActiveRecord::Base
  validates_presence_of :title, :host, :port
  validates_uniqueness_of :title
end
