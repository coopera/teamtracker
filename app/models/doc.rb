class Doc
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :title, type: String
  field :description, type: String
  field :implementation, type: String

  has_many :related_links
  belongs_to :user

  accepts_nested_attributes_for :related_links, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :description, :implementation

  validates :title, length: { minimum: 5 }

  def tag_list
    tags.split(",")
  end
end
