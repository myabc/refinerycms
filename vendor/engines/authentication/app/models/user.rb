require 'digest/sha1'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :login,            String,   :writer => :protected
  property :email,            String,   :writer => :protected
  property :crypted_password, String,   :length => 40
  property :salt,             String,   :length => 40
  property :remember_token,   String
  property :remember_token_expires_at, DateTime
  property :activation_code,  String,   :length => 40
  property :activated_at,     DateTime
  property :state,            String,   :default => "passive"
  property :deleted_at,       DateTime
  property :created_at,       DateTime
  property :updated_at,       DateTime
  property :superuser,        Boolean,  :default => false
  property :reset_code,       String,   :writer => :protected

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

  # TODO: DM Porting Remove serialize :plugins_column # Array # this is seriously deprecated and will be removed later.

  has n, :plugins, :model => "UserPlugin", :order => "position ASC"

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  # attr_accessible :login, :email, :password, :password_confirmation, :plugins, :reset_code
  # TODO: DM Porting - use :writer => protected (but revisit this)


  #-------------------------------------------------------------------------------------------------
  # Authentication

  # See http://rdoc.info/rdoc/binarylogic/authlogic/blob/85b2a6b3e9993b18c7fb1e4f7b9c6d01cc8b5d17/Authlogic/ActsAsAuthentic
  #acts_as_authentic do |c|
   # c.perishable_token_valid_for 10.minutes

    # http://www.binarylogic.com/2008/11/23/tutorial-easily-migrate-from-restful_authentication-to-authlogic/
    # Unfortunately, this seems to cause problems when you add Refinery to an app that already had
    # an Authlogic-created users table. You may need to comment these 2 lines out if that is the case.
    #c.act_like_restful_authentication = true
    #c.transition_from_restful_authentication = true

    # If users prefer to use their e-mail address to log in, change this setting to 'email' in
    # config/application.rb
    # This currently only affects which field is displayed in the login form. As long as we have
    # find_by_login_method :find_by_login_or_email, they can still actually use either one.
    #c.login_field = defined?(Refinery.authentication_login_field) ? Refinery.authentication_login_field : "login"
  #end #if self.table_exists?


  # Allow users to log in with either their username *or* email, even though we only ask for one of those.
  def self.find_by_login_or_email(login_or_email)
    find_by_login(login_or_email) || find_by_email(login_or_email)
  end

  def deliver_password_reset_instructions!(request)
    reset_perishable_token!
    UserMailer.deliver_reset_notification(self, request)
  end

  #-------------------------------------------------------------------------------------------------

  def plugins=(plugin_titles)
    unless self.new_record? # don't add plugins when the user_id is NULL.
      self.plugins.delete_all

      plugin_titles.each_with_index do |plugin_title, index|
        self.plugins.create(:title => plugin_title, :position => index) if plugin_title.is_a?(String)
      end
    end
  end

  def authorized_plugins
    self.plugins.collect {|p| p.title} | Refinery::Plugins.always_allowed.titles
  end

  def can_delete?(other_user = self)
    !other_user.superuser and User.count > 1 and (other_user.nil? or self.id != other_user.id)
  end

end
