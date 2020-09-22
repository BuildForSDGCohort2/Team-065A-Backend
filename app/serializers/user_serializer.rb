class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone, :gender, :address, :avatar, :state, :country, :user_type

  belongs_to :userref, class_name: 'User', polymorphic: true, optional: true
  # has_many :reviews
end
