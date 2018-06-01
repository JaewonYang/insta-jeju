class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  has_many :posts
         
  has_many :like_posts, through: :likes, source: :post
  has_many :likes       
         
         
  validates :name, presence: true
  
  
  after_create :default_user
  
  
  #self: 유저 한명을 뽑았을 때, 그 유저 한명을 의미한다.
  def default_user
    self.add_role(:newuser) if self.roles.blank?
  end
     
     
         
end
