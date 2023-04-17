class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :activity
end
