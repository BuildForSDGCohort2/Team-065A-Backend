class ReviewSerializer < ActiveModel::Serializer
  attributes :owner, :teacher, :rating, :content, :created_at, :updated_at
end
