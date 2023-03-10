require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(email: 'sam@outlook.com', password: 'password',
             password_confirmation: 'password')
  end

  before { subject.save }

  context 'Test user validations' do
    it 'is a user with valid attributes' do
      expect(subject).to be_valid
    end

    it 'email should be valid' do
      subject.email = 'sam'
      expect(subject).to_not be_valid
    end

    it 'emial should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
