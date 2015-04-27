class TeamInfo
  include Mongoid::Document

  field :slack_id_to_member_name, type: Hash
end
