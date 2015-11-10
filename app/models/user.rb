class User <  ActiveRecord::Base
include ActiveModel::Validations
before_create :create_app_token
mount_uploader :avatar, AvatarUploader
  enum role: [:unknown, :user, :vip, :admin, :client, :manager]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end

#  has_and_belongs_to_many :roles
  has_many :flash_messages
  has_many :user_tracings
  has_many :products, through: :orders
  has_many :orders
  has_many :order_histories
  has_many :comments
  has_many :childs, class_name: "User",
                          foreign_key: "manager_id"
 
  belongs_to :director, class_name: "User"
  belongs_to :user_theme
  belongs_to :town
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
  devise :omniauthable,
         :omniauth_providers => [:google_oauth2, :facebook, :vkontakte]
  devise :registerable,
         :confirmable,
         :traceable,
         :timeoutable,
#         :lastseenable,
         :encryptable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :username, :time_zone, :town_id, :user_theme_id, :role, :avatar, :aircompany_id, :nickname, :provider, :url, :uid
#  validates :username,
#    :uniqueness => {:case_sensitive => false}
#  validates :email, :presence => true, 
#                    :length => {:minimum => 3, :maximum => 70},
#                    :uniqueness => {:case_sensitive => false },
#                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
#  has_attached_file :avatar, :styles => { :big => "600x600>", :medium_400 => "400x400>", :medium_300 => "300x300>", :small => "200x200>", :thumb => "100x100>" }, :thumb_50 => "50x50>", :default_url => "/images/:style/missing.png"
#  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def set_default_role
    self.role ||= :user
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.vkontakte_data"] && session["devise.vkontakte_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token) 
    end
  end

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.extra.raw_info.domain+'@vk.com', :password => Devise.friendly_token) 
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          password: Devise.friendly_token
#          password_salt: Devise.friendly_token
          )
        end
     end
  end

  def confirmation_required?
    super && email.present?
  end

private
  def create_app_token
    app_token = Devise.friendly_token
  end
end

