class Entity < ActiveRecord::Base
  has_many :tags

  def tag_names
    tags.map &:tag
  end
end
