require_relative 'spec_helper'

describe "Integration" do
  context "Course relation to Department" do
    let(:dot_net){
      Course.new.tap do |c|
        c.name = "Advanced .NET Programming"
        c.save
      end
    }

    let(:comp_sci){
      Department.new.tap do |d|
        d.name = "Computer Science"
        d.save
      end
    }
    before do
      Course.create_table
      Department.create_table
    end

    after do
      Course.drop_table
      Department.drop_table
    end

    it "has a department" do
      expect(dot_net.department).to be_nil
      dot_net.department = comp_sci
      expect(dot_net.department.name).to eq('Computer Science')
    end

    it "persists department" do
      dot_net.department = comp_sci
      dot_net.save

      dot_net_from_db = Course.find_by_name('Advanced .NET Programming')
      expect(dot_net_from_db.department.name).to eq('Computer Science')
    end

    it "courses listed from department" do
      dot_net.department = comp_sci
      dot_net.save

      expect(comp_sci.courses.count).to eq 1
      expect(comp_sci.courses.first.name).to eq("Advanced .NET Programming")
    end

    it "courses added to departments" do
      comp_sci.courses << dot_net

      expect(comp_sci.courses.count).to eq 1
      expect(comp_sci.courses.first.name).to eq("Advanced .NET Programming")
    end

    it "persists changes to changed objects after course added" do
      comp_sci.name = "Communications"
      dot_net.name = "Underwater Basket Weaving"
      comp_sci.courses = [dot_net]

      comp_sci_from_db = Department.find_by_name "Communications"
      expect(comp_sci_from_db.courses.count).to eq 1
      expect(comp_sci_from_db.courses.first.name).to eq("Underwater Basket Weaving")
    end
  end
end
