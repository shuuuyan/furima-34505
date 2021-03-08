class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :familyname, :firstname,           format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: 'is invalid' } # 全角(ひら、カタ、漢字)の正規表現
    validates :familyname_kana, :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' } # ユーザー本名全角カナの正規表現
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Please set including both letters and numbers'  # passwordが半角英字数字のみ許可する
    validates :nickname
    validates :birthdate
  end

  # 復習のため残しています↓(with_optionsでpresence: trueをまとめる前の記述)

  # validates :nickname,               presence: true
  # validates :familyname,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }   #ユーザー本名全角(ひら、カタ、漢字)の正規表現
  # validates :firstname,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }   #ユーザー本名全角(ひら、カタ、漢字)の正規表現
  # validates :familyname_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }      # ユーザー本名全角カタカナの正規表現
  # validates :firstname_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }      # ユーザー本名全角カタカナの正規表現
  # validates :birthdate,              presence: true
  # validates :password,               presence: true, format: {with: /\A[a-z0-9]+\z/i }
  # validates :password_confirmation,  presence: true, format: {with: /\A[a-z0-9]+\z/i }
end
