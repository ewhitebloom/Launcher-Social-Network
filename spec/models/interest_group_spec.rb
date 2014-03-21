require 'spec_helper'

describe InterestGroup do
  let(:valid_attrs) { { name: 'Steve' } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end
    end

    it 'requires a name' do
      # Create an InterestGroup using all of the valid attributes except replace
      # the `name` key with a blank String.
      interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
      expect(interest_group.errors[:name]).to include "can't be blank"
    end

    it 'requires a creator' do
      # your code here
    end

    it 'optionally takes a description' do
      # your code here
    end
  end

  describe 'associations' do
    it 'should have a creator' do
    # create a User object
    creator_attributes = {
      first: "Barry",
      last: "Zuckercorn",
      email: "barry@hesverygood.com"
    }
    creator = User.create(creator_attributes)

    # create an InterestGroup object with that user object as the creator
    group_attributes = {
      name: "Excuses",
      user: creator
    }
    group = InterestGroup.create(group_attributes)

    expect(group.user).to eq creator
  end
end

describe '#number_of_posts' do
  it 'returns the number of posts' do
      # your code here for happy path test
    end

    it 'returns 0 if there are no posts' do
      # your code here for boundary condition test
    end

    # etc.
  end

end
