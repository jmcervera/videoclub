require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :item }
  end
end
