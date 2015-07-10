require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user) {User.new(username: "username", firstname: "Jackson", lastname: "Lee", email: "j@gmail.com", password: "12345678", password_confirmation: "12345678")}

  describe "model validations" do
    it "is valid with an username, email and password" do
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      new_user = User.new(username: "username", password: "12345678", password_confirmation: "12345678")

      expect(new_user).to be_invalid
      expect(new_user).to have(1).errors_on(:email)
    end

    it "is invalid without an username" do
      new_user = FactoryGirl.build(:user, username: '')

      expect(new_user).to be_invalid
    end

    it "is invalid without a password" do
      new_user = FactoryGirl.build(:user, password: '')

      expect(new_user).to be_invalid
    end

    it "is invalid without a password longer than 7 characters" do
      new_user = FactoryGirl.build(:user, password: '1234567')
      expect(new_user).to be_invalid
    end
  end

  describe 'auto-generated user attributes' do
    subject(:user) { FactoryGirl.create(:user) }

    it 'has a created_at' do
      expect(user.created_at).not_to be_nil
    end

    it 'has a updated_at' do
      expect(user.updated_at).not_to be_nil
    end
  end

  describe 'association' do
    subject(:user) { FactoryGirl.create(:user) }

    describe 'with products' do
      it 'should have many products' do
        expect(user).to respond_to(:products)
      end

      it 'should have many product_quantities' do
        expect(user).to respond_to(:product_quantities)
      end

      it 'should have many orders' do
        expect(user).to respond_to(:orders)
      end

      it 'should have many order_histories' do
        expect(user).to respond_to(:order_histories)
      end
    end
  end
end

# def product_quantity(id)
#   self.product_quantities.where(product_id: id).first.quantity
# end
#
# def product_to_update(id)
#   self.product_quantities.where(product_id: id).first
# end
