class RelatedLink

  include Mongoid::Document
  include Mongoid::Timestamps

  # field :doc_id, type: String
  field :title, type: String
  field :link, type: String

  belongs_to :doc
  # embedded_in :doc

  validates_presence_of :link, :title
end
