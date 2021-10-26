class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "が無効です。全角文字で入力してください。" }
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "が無効です。全角文字で入力してください。" }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: "が無効です。全角カナで入力してください。" }
    validates :name_reading, format: { with: /\A[ァ-ヶー]+\z/, message: "が無効です。全角カナで入力してください。" }
    validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "は半角英数字６文字以上で入力してください"}
  end
  has_many :items
  has_many :purchases
end
