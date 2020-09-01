require 'rails_helper'
RSpec.describe Plane, type: :model do
  let(:plane) {FactoryBot.create :plane}

  describe "Associations" do
    it "should has many schedules" do
      is_expected.to have_many(:schedules).dependent(:nullify)
    end
  end
end
