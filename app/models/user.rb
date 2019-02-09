
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :books, dependent: :destroy

  # ログイン時にアドレス不要とするためnameをユニークに
  validates :name, presence: true, uniqueness: true
  def email_required?
    false
  end
  def email_changed?
    false
  end
end
