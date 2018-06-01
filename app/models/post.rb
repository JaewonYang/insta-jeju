class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    validates :image, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    
    belongs_to :user
    
    # m:n 관계를 맺을 땐 별칭을 만들어서 관계를 설정한다 -> 코드의 중복을 막기 위해
    has_many :likes

    has_many :like_users, through: :likes, source: :user
    
    # @post.toggle_like(current_user)
    def toggle_like(user)
        if self.like_users.include?(user) #내가 좋아요를 눌렀다면
            self.like_users.delete(user) #
        else
            self.like_users.push(user)
            # self.like_user << user

        end
        
    end
    
    # def activate!
    #   self.active = false
    #   self.save
    # end
end
