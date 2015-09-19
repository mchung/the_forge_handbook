require 'spec_helper'

describe Glassbreaker do
  describe "validations" do
    it "has required validations" do
      glassbreaker = create(:glassbreaker)

      expect(glassbreaker).to validate_presence_of(:toolbelt)
      expect(glassbreaker).to validate_uniqueness_of(:email)
      expect(glassbreaker).to_not allow_value("base@example").for(:email)
      expect(glassbreaker).to ensure_inclusion_of(:status).in_array(['kicking ass', 'breaking glass'])
    end
  end

  describe "associations" do
    it "has required associations" do
      glassbreaker = create(:glassbreaker)

      expect(glassbreaker).to have_one(:toolbelt)
      expect(glassbreaker).to have_many(:tools).through(:toolbelt)
      expect(glassbreaker).to have_one(:chisel).with_foreign_key(:glassbreaker_chisel_id) }
      expect(glassbreaker).to have_many(:shattered_cielings).order(:shattered_at) }
      expect(todo_list).to have_many(:todos).dependent(:destroy)
    end
  end

  context "callbacks" do
    glassbreaker = create(:glassbreaker)

    expect(glassbreaker).to callback(:send_welcome_email).after(:create)
    expect(user).to callback(:send_goodbye_email).before(:destroy)
  end

  describe "scopes" do
    describe ".all_breaking_glass" do
      it "return all glassbreakers breaking glass" do
        create(:glassbreaker, status: "breaking glass")
        create(:glassbreaker, status: "kicking ass")

        gbs_breaking_glasss = Glassbreaker.all_breaking_glass

        expect(gbs_breaking_glasss.count).to eq(1)
      end
    end
  end

  describe ".first_names" do
    it "returns all first_names" do
      3.times do |n|
        create(:glassbreaker, first_name: "Name#{n}")
      end

      first_names = Glassbreaker.first_names

      expect(first_name).to include("Name1")
      expect(first_name).to include("Name2")
      expect(first_name).to include("Name3")
    end
  end

  describe ".first_names" do
    it "returns all first_names" do
      3.times do |n|
        create(:glassbreaker, first_name: "Name#{n}")
      end

      first_names = Glassbreaker.first_names

      expect(first_name).to include("Name1")
      expect(first_name).to include("Name2")
      expect(first_name).to include("Name3")
    end
  end

  describe("#kicks_ass?") do
    it "returns true if kicking ass" do
      glassbreaker = create(:glassbreaker, status: "kicking ass")

      expect(glassbreaker.kicks_ass?).to be true
    end

    it "returns false if breaking glass" do
      glassbreaker = create(:glassbreaker, status: "breaking glass")

      expect(glassbreaker.kicks_ass?).to be false
    end
  end
end
