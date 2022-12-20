class Category < ApplicationRecord
  # relation
  has_many :sub_categories, dependent: :destroy
end
