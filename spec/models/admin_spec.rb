require "rails_helper"

describe Admin do

  it "has a valid factory" do
    expect(build(:admin)).to be_valid
  end

  let(:admin) { build(:admin, password: nil) }

  describe "ActiveModel validations" do
    it { expect(admin).to validate_presence_of(:name) }
    it { expect(admin).to validate_presence_of(:username) }
    it { expect(admin).to validate_uniqueness_of(:username) }
    it { expect(admin).to have_secure_password }
  end

  describe "ActiveRecord associations" do
    it { expect(admin).to have_many(:posts) }
  end

end
