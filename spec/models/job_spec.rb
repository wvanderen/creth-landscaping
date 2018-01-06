require 'rails_helper'

RSpec.describe Job, type: :model do
    
    let(:my_user) { User.create!(email: "liam@example.com", password: "password") }
    let(:job) { Job.create!(user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes") }

    describe "attributes" do
      it "has title and body attributes" do
          expect(job).to have_attributes(user: my_user, address: "Address", yardsize: 100, specialrequests: "Special Requests", stripes: true, grasstreated: true, mulching: true, mulchexisting: true, newbushestrees: true, rate: 150, status: 0, paid: true, notes: "Notes")
      end
  end
end

#Need to test date field