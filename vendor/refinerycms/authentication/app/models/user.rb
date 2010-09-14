require 'digest/sha1'

class User
  include DataMapper::Resource

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  property :id,               Serial
  property :login,            String#,   :writer => :protected
=begin
  property :email,            String,   :writer => :protected
  property :crypted_password, String,   :length => 40
  property :password_salt,    String,   :length => 40
  property :persistence_token,String
  property :perishable_token, String

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  #validates_present     :login, :email # handled by other checks
  #validates_present     :password,                   :if => :password_required? # handled by other checks
  validates_present     :password_confirmation,      :if => :password_required?
  validates_length       :password, :within => 4..40, :if => :password_required?
  validates_is_confirmed :password,                   :if => :password_required?
  validates_length       :login,    :within => 3..40
  validates_length       :email,    :within => 3..100
  validates_is_unique   :login, :email, :case_sensitive => false
  before :save, :encrypt_password

=end
  property :created_at,       DateTime
  property :updated_at,       DateTime

  timestamps :at

  #-------------------------------------------------------------------------------------------------
  # Authentication

  # Allow users to log in with either their username *or* email, even though we only ask for one of those.
  def self.find_by_login_or_email(login_or_email)
    find_by_login(login_or_email) || find_by_email(login_or_email)
  end

  def deliver_password_reset_instructions!(request)
    reset_perishable_token!
    UserMailer.reset_notification(self, request).deliver
  end

  #-------------------------------------------------------------------------------------------------

  has n, :roles, :through => Resource
  has n, :plugins, 'UserPlugin', :order => [:position.asc]
  has_friendly_id :login, :use_slug => false

  def plugins=(plugin_names)
    unless self.new? # don't add plugins when the user_id is NULL.
      self.plugins.all.destroy

      plugin_names.each_with_index do |plugin_name, index|
        self.plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
      end
    end
  end

  def authorized_plugins
    self.plugins.collect { |p| p.name } | Refinery::Plugins.always_allowed.names
  end

  def can_delete?(user_to_delete = self)
    !user_to_delete.new_record? and
      !user_to_delete.has_role?(:superuser) and
      Role[:refinery].users.count > 1 and
      self.id != user_to_delete.id
  end

  def add_role(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
    self.roles << Role[title] unless self.has_role?(title)
  end

  def has_role?(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
    (role = Role.first(:title => title.to_s.camelize)).present? and self.roles.collect{|r| r.id}.include?(role.id)
  end

end
