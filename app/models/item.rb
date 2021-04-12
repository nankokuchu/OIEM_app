class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :items_status
  belongs_to :order_status

  with_options presence: true do
    with_options format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英文字を入力してください' } do
      validates :eng_material
      validates :eng_name
    end
    validates :jp_name
    validates :jp_material
    validates :manufacture_name
    validates :item_selection
    validates :manufacture_item_selection
    validates :manufacture_url
    validates :weight
    validates :image
    validates :items_status_id
  end

  with_options numericality: true, inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ } do
    validates :selling_price
    validates :purchase_price
  end

  def self.search(search)
    if search != ""
      Item.where('jp_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
