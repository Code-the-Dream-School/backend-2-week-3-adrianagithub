require 'rails_helper'
RSpec.describe Order, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  test_subject_attributes = FactoryBot.attributes_for(:order)
  subject { Order.new(test_subject_attributes)}
  #subject { Order.new(product_name: "pencil", product_count: "4", customer: 1)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the product_count is integer" do
    product_count = subject.product_count
    if (product_count.is_a? Integer) == 'false'
      expect(subject).to_not be_valid
    end
  end
  it "is not valid if the without a customer" do
    subject.customer_id = 5000
    expect(subject).to_not be_valid
  end
  # Models Order
  # validates :product_name, presence: true
  # validates :product_count, presence: true
  # belongs_to :customer
  # validates :customer, presence: true
end
