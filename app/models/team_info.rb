class TeamInfo
  include Mongoid::Document

  field :slack_id_to_member_name, type: Hash
  field :channel_id_to_name, type: Hash
end
