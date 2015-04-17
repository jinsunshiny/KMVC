class User < ActiveRecord::Base
  #attr_accessible :user_id, :password_digest, :nickname, :phone_num, :email, :address, :mission, :is_family

  has_secure_password

  validates :user_id, :presence => true, uniqueness: true
  validates :password, :presence => true, confirmation: true, length: {minimum: 6}, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #TODO : phone num regex 있어야함.
  validates :nickname, :presence => true, uniqueness: true
  validates :phone_num, :presence => true

  #TODO : 주소 검색 api 붙여야됨 (회원가입, 회원 정보 업데이트 시에)

  #mission, is_family 필드는 사용자가 입력하는 것이 아닌 시스템 또는 운영자가 입력
  #mission, is_family 필드는 가입할 때는 받지 않지만 시스템 상으로 디폴트 값은 넣어줘야 할 듯. (mission 0 : 아무 직분 없는 사람 / is_family : 인증 안된 사용자)
end