class Work < ActiveRecord::Base
  attr_accessible :description, :name, :url

  def capture
    "http://capture.heartrails.com/?#{url}" if url
  end
end
