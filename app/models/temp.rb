class Temp < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :champs, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "temp_id", "updated_at", "user_id", "usertemp_id"]
  end
end
