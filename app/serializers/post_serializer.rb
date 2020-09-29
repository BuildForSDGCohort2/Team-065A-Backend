class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :created_at, :updated_at
end
