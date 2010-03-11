class UserPlugin
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :title,    String
  property :position, Integer

  belongs_to :user

end
