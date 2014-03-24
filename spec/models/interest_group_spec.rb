require 'spec_helper'

describe InterestGroup do
  let(:valid_attrs) { { name: 'Steve', user: 1 } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end
    end

    it 'requires a name' do
      interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
      expect(interest_group.errors[:name]).to include "can't be blank"
    end

    it 'requires a creator' do
      interest_group = InterestGroup.new(valid_attrs.merge(user: 2))
      expect(interest_group.errors[:user]).to include "can't be blank"
    end

    it 'optionally takes a description' do
      interest_group = InterestGroup.new(valid_attrs.merge(description: 'a little description'))
      expect(interest_group).to be_valid
    end
  end

  describe 'associations' do
    it 'should have a creator' do
      creator_attributes = {
        first: "Barry",
        last: "Zuckercorn",
        email: "barry@hesverygood.com",
        role: 'launcher'
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
    group = InterestGroup.new(valid_attrs)
    Post.new({user_id: 1, title: 'hi', body: 'hi', date: Time.now, group_id: group.id })
    expect(group.number_posts).to eq 1
  end

  it 'returns 0 if there are no posts' do
    group = InterestGroup.create(valid_attrs)
    expect(group.number_posts).to eq 0
  end
end
end
