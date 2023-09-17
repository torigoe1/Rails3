class Room < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :price, presence:true, numericality: {greater_than_or_equal_to: 0} 

    has_many :reservation, dependent: :destroy
    belongs_to :user

    validates :start_date, {presence:true}
    validates :end_date, {presence:true}
    validate :date_check
    validates :people, {length:{minimum:1}}
  
    def date_check
        if self.start_date != nil && self.end_date != nil
            if self.start_date > self.end_date
            errors.add(:end_date,"は開始日より前の日付は登録できません")
            end
        end
    end

end
