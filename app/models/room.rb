class Room < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :price, presence:true, numericality: {greater_than_or_equal_to: 0} 

    has_many :reservation, dependent: :destroy
    belongs_to :user

    mount_uploader :image_name, ImageNameUploader

end
