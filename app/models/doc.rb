class Doc
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :implementation, type: String

  has_many :related_links
  # embeds_many :related_links

  accepts_nested_attributes_for :related_links, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :description, :implementation

  validates :title, length: { minimum: 5 }

  # acts_as_ordered_taggable
  # I need to find a mongo solution
end
