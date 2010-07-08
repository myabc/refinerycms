class PagePart
  include DataMapper::Resource

  property :id,         Serial
  property :page_id,    Integer
  property :title,      String
  property :body,       Text
  property :position,   Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :page, :model => 'Page'

  validates_present :title
  alias_attribute :content, :body

  def to_param
    "page_part_#{self.title.downcase.gsub(/\W/, '_')}"
  end

  before :save, :normalise_text_fields

protected
  def normalise_text_fields
    unless self.body.blank? or self.body =~ /^\</
      self.body = "<p>#{self.body.gsub("\r\n\r\n", "</p><p>").gsub("\r\n", "<br/>")}</p>"
    end
  end

end
