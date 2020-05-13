# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it 'has a valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'is valid with email, and password' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without an email address' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'does something with multiple users' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      expect(true).to be_truthy
    end
  end
end
