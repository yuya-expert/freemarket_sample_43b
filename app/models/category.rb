class Category < ApplicationRecord
  has_many :products

  def middle_category
    @large_category = Category.where(parent_id: [0])
    @large_category.each do |lc|
      @middle_category = Category.where(parent_id: lc.id)
    end
  end
end
