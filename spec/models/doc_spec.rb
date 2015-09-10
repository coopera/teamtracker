require 'rails_helper'

RSpec.describe Doc do

  it { should have_many :related_links }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :implementation }

end
