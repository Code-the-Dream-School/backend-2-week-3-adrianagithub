require 'rails_helper'
RSpec.describe Customer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end 
  it "is not valid if the phone number is not 10 chars" do
    phone = subject.phone.length
    if phone <10
      expect(subject). to_not be_valid
    end
  end
  it "is not valid if the phone number is not all digits" do
    phone = subject.phone
    if (phone.is_a? Integer) == 'false'
      expect(subject). to_not be_valid
    end
  end
  it "is not valid if the email address doesn't have a @" do
    email = subject.email
    if (email.include?("@")) == 'false'
    expect(subject.email).include ("@")
    end 
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Jack Smith")
  end
end
    #presence: {message: "Number is requred"} , length: {is: 10}
    #it { is_expected.to validate_length_of(:phone).is_at_most(10)}
    #expect (subject).to validate_length_of(:phone).is_at_most(10)
    # expect(subject).to_not be_valid
    #it { is_expected.to allow_value(nil).for(:description) }
    #it { is_expected.to validate_length_of(:description).is_at_most(255) }
    #to be_between(1, 10)
    #it { should ensure_length_of(phone).is_equal_to(10) }
    #subject.phone.size >=10
    # subject.phone=nil
    # expect(subject).to_not be_valid
    # [:phone].size.should >= 10
    #is_greater_than_or_equal_to(0)
