class RelatedLink

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :link, type: String

  belongs_to :doc

  validates_presence_of :link, :title
end
