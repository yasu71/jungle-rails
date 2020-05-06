require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    subject {
      described_class.new(
        name: "Mickey Mouse",
        email: "mickeymouse@gmail.com",
        password: "mickey",
        password_confirmation: "mickey"
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without an email' do 
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

  end
end
