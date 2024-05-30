class Group < ApplicationRecord
  has_many :champs, inverse_of: :group
end