
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :books, dependent: :destroy

  # refile使用用
  attachment :image

  # 長さ制限
  validates :name, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}

  # ログイン時にアドレス不要とするためnameをユニークに
  validates :name, presence: true, uniqueness: true
  def email_required?
    false
  end
  def email_changed?
    false
  end
end
