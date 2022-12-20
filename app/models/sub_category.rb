class SubCategory < ApplicationRecord
  # relation
  belongs_to :category
  has_many :items, dependent: :destroy
end
