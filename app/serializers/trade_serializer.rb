class TradeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id, :price, :quantity
end
