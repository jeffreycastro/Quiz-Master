require 'rails_helper'

RSpec.describe Exam, type: :model do
  context "associations" do
    it { should have_many(:exam_items) }
    it { should accept_nested_attributes_for(:exam_items) }
  end

  context "validation" do
    it "requires a name" do
      expect(Exam.new(name: nil)).not_to be_valid
    end
  end
end
