class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

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

  def total_day
    total_day = (end_date - start_date).to_i
  end

  def total_price
    total_price = (total_day * people * room.price)
  end


end
