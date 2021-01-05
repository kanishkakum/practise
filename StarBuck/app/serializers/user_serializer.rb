class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  attribute "name"  do
  	"kanishk"
  end

end
