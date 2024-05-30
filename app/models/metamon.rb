class Metamon < ApplicationRecord
  has_many :scores,dependent: :destroy
  has_one_attached :image
  belongs_to :user ,optional: true
  def self.ransackable_attributes(auth_object = nil)
    %w(name gamename setumei metaid)
  end
end
