require "rails_helper"

RSpec.describe Schedule, type: :model do
  subject {
    described_class.new( id: 4,
                        time: "2020-08-30 10:41:00".to_datetime,
                        status: "0",
                        title: "hi every one!",
                        from: "2",
                        to: "3",
                        runway_id: 2,
                        plane_id: 7,
                        user_id: 9,
                        created_at: "2020-08-31 06:54:18.925738".to_datetime,
                        updated_at: "2020-08-31 06:54:18.925738".to_datetime)
  }
  describe "Associations" do
    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "belongs to runway" do
      association = described_class.reflect_on_association(:runway)
      expect(association.macro).to eq :belongs_to
    end

    it "belongs to plane" do
      association = described_class.reflect_on_association(:plane)
      expect(association.macro).to eq :belongs_to
    end

    it "has many notifications" do
      association = described_class.reflect_on_association(:notifications)
      expect(association.macro).to eq :has_many
    end

    it "has many logs" do
      association = described_class.reflect_on_association(:logs)
      expect(association.macro).to eq :has_many
    end

    it "has many requests" do
      association = described_class.reflect_on_association(:requests)
      expect(association.macro).to eq :has_many
    end
  end

  describe "Delegate" do
    context "when delegating methods to runway object" do
      it {should respond_to(:runway_name)}
      end

    context "when delegating methods to user object" do
      it { should respond_to(:user_name) }
    end

    context "when delegating methods to plane object" do
      it { should respond_to(:plane_name) }
    end
  end

  describe ".scope" do
    it "return time schedules" do
      expect(Schedule.time_schedules("2020-08-30 10:41:00".to_datetime)).to_not include(subject)
    end

    it "return user schedules" do
      expect(Schedule.user_schedules(0)).to be_empty
    end

    it "return all schedules now" do
      expect(Schedule.all_schedules_now("2020-08-30 10:41:00".to_datetime)).to_not include(subject)
    end
  end

  describe "public method" do
    let(:subjects) {Array.new}
    before(:each) do
      subjects << subject
    end
    context ".check_runwayid_form?" do
      it "false when check runwayid with runway_id > count" do
        expect(Schedule.check_runwayid_form?(subjects, 1, 2)).to eql(false)
      end

      it "false when check runwayid with runway_id is correct" do
        expect(Schedule.check_runwayid_form?(subjects, 2, 2)).to eql(false)
      end

      it "true when not 2 case above" do
        expect(Schedule.check_runwayid_form?(subjects, 4, 3)).to eql(true)
      end
    end

    context ".find_runwayable" do
      it "when find runwayable "do
      expect(Schedule.find_runwayable("2020-08-30 10:41:00".to_datetime)).to be_empty
      end
    end
  end
end
