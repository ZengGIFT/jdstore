# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  product_id   :integer
#  order_status :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  UPAID = 1
  PAYING = 2
  DELIVERING = 3
  DELIVERED = 4
  CALLBACK = 5

  STATUSES = {
    UPAID => "upaid",
        PAYING => "paying",
        DELIVERING => "delivering",
        DELIVERED => "delivered",
        CALLBACK => "callback"
   }

  validates_inclusion_of :order_status, :in => STATUSES.keys

   # just a helper method for the view
  def status_name
     STATUSES[order_status]
  end

end
