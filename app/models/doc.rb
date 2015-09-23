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

  before_save :downcase_tags

  def tag_list
    tags.split(",")
  end

  scope :from_author, ->(id){
    where(:user_id => id)
  }

  def downcase_tags
    self.tags_array = self.tags_array.map(&:downcase)
  end
  
end
