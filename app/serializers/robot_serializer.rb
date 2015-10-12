class RobotSerializer < ActiveModel::Serializer
  attributes :name, :birth_day
  belongs_to :user, serializer: UserSerializer
end
