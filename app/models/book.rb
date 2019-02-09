class Book < ApplicationRecord
  # 関連付け
  belongs_to :user
end
