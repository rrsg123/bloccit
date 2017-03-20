require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: title, body: body, user: user) }  


  it { should belong_to(:topic) }
  it { is_expected.to belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }

  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:body).is_at_least(20) }

  describe "attributes" do
    it "has a title, body, and user attribute" do
       expect(post).to have_attributes(title: title, body: body, user: user)
    end   
  end
end
