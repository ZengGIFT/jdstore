# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  is_present  :boolean          default(FALSE)
#

class Product < ApplicationRecord
  has_many :orders
  
  mount_uploader :image, ImageUploader

  scope :is_on_shell, ->{where(is_present: true)}
end
