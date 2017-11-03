require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { User.create!(email: "liam@example.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "This is a post, this test may pass.") }
  
  it { is_expected.to belong_to(:user) }
  
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }  

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }
  
  describe "attributes" do
      it "has title and body attributes" do
          expect(wiki).to have_attributes(title: "New Wiki Title", body: "This is a post, this test may pass.")
      end
  end

end
