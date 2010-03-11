class InquirySetting
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :value,        Text
  property :destroyable,  Boolean
  property :created_at,   DateTime
  property :updated_at,   DateTime

  def self.confirmation_body
    find_or_create_by_name("Confirmation Body")
  end

  def self.notification_recipients
    find_or_create_by_name("Notification Recipients")
  end

end
