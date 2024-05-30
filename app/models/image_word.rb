# app/models/image_word.rb
class ImageWord < ApplicationRecord
  validates :image_name, presence: true
  validates :word, presence: true
end