class Score < ApplicationRecord
  belongs_to :metamon, optional: true
end
