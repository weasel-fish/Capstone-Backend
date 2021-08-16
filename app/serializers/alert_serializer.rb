class AlertSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :sighting_id
  # belongs_to :sighting
  attribute :animal
  attribute :outing

  def animal
    animal = object.sighting.animal
    animal[:common_name]
  end
  
  def outing
    outing = object.sighting.outing
    {name: outing[:name], id: outing.id, date: outing.date}
  end
end
