require 'rails_helper'
RSpec.describe Runway, type: :model do
  let(:runway) {FactoryBot.create :runway}

  describe "Associations" do
    it "should has many schedules" do
      is_expected.to have_many(:schedules).dependent(:nullify)
    end
  end
end
