class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category_id

  def price
    object.price.to_f
  end
end
