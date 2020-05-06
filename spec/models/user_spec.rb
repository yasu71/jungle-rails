require "rails_helper"

RSpec.describe User, type: :model do

  describe "Validations" do

    subject {
      described_class.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickeymouse@gmail.com",
        password: "mickey",
        password_confirmation: "mickey"
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it "is not valid without an email" do 
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "is not valid if the account already exists" do
      another_user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickeymouse@gmail.com",
        password: "mickey",
        password_confirmation: "mickey"
      )
      another_user.save

      expect(another_user).to be_valid
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end

    it "is not valid with a less than 6 characters long password" do
      subject.password = "test"
      subject.password_confirmation = "test"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe ".authenticate_with_credentials" do

    it "returns a user with valid credentials" do
      user = User.new(
          first_name: "Mickey",
          last_name: "Mouse",
          email: "mickey@mail.com",
          password: "Mickey",
          password_confirmation: "Mickey"
        )
      user.save

      authenticate = User.authenticate_with_credentials(
        "mickey@mail.com", "Mickey"
      )

      expect(authenticate).to eq(user)
    end

    it "returns nil with an invalid email" do
      user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickey@mail.com",
        password: "Mickey",
        password_confirmation: "Mickey"
      )
      user.save

      authenticate = User.authenticate_with_credentials(
        "minnie@mail.com", "Mickey"
      )

      expect(authenticate).to be_nil
    end

    it "returns nil with an invalid password" do
      user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickey@mail.com",
        password: "Mickey",
        password_confirmation: "Mickey"
      )
      user.save

      authenticate = User.authenticate_with_credentials(
        "mickey@mail.com", "Minnie"
      )

      expect(authenticate).to be_nil
    end

    it "returns a user with an extra spaces before and after for email" do
      user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickey@mail.com",
        password: "Mickey",
        password_confirmation: "Mickey"
      )
      user.save

      authenticate = User.authenticate_with_credentials(
        " mickey@mail.com ", "Mickey"
      )

      expect(authenticate).to eq(user)
    end

    it "returns a user with the wrong case for email" do
      user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickey@mail.com",
        password: "Mickey",
        password_confirmation: "Mickey"
      )
      user.save

      authenticate = User.authenticate_with_credentials(
        "Mickey@mail.COM", "Mickey"
      )

      expect(authenticate).to eq(user)
    end

    it "returns a user with an extra spaces and the wrong case for email" do
      user = User.new(
        first_name: "Mickey",
        last_name: "Mouse",
        email: "mickey@mail.com",
        password: "Mickey",
        password_confirmation: "Mickey"
      )
      user.save

      authenticate = User.authenticate_with_credentials(
        " Mickey@mail.COM ", "Mickey"
      )

      expect(authenticate).to eq(user)
    end

  end

end