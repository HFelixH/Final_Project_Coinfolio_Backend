class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :crypto
end
