class Inquiry
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :email,      String
  property :phone,      String
  property :message,    Text
  property :position,   Integer
  property :open,       Boolean,  :default => true
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_present :name
  validates_format  :email,
                    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                    :message => 'must be valid'

  # FIXME: for DataMapper port
  #acts_as_indexed :fields => [:name, :email, :message, :phone],
  #                :index_file => [Rails.root.to_s, "tmp", "index"]

  default_scope :order => [ :created_at.desc ]

  def self.latest(number=7)
    all(:limit => number)
  end

end
