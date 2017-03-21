require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { should have_many(:posts) }

  describe "attributes" do
    it "responds to name and description attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
     end

    it "should respond to public" do
      expect(topic).to respond_to(:public)
    end

    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end
