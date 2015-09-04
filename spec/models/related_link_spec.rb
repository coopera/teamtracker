
RSpec.describe RelatedLink do
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
  it { should belong_to :doc }
end
