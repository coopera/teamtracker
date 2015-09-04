require 'rails_helper'

class RelatedLink

  include Mongoid::Document

  # field :doc_id, type: String

  belongs_to :doc

  validates_presence_of :link, :title
end
