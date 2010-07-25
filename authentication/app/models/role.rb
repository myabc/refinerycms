class Role
  include DataMapper::Resource

  property :id,    Serial
  property :title, String

  has n, :users, :through => Resource

  # TODO: Fixme DM before_validation :camelize_title
  validates_uniqueness_of :title

  def camelize_title(role_title = self.title)
    self.title = role_title.to_s.camelize
  end

  def self.[](title)
    first_or_create(:title => title.to_s.camelize)
  end

end
