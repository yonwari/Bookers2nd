class Book < ApplicationRecord
  # 関連付け
  belongs_to :user

  # 長さ制限
  validates :title, presence: true
  validates :body, length: {in: 1..200}
end
