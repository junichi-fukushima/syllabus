require 'rails_helper'

RSpec.describe Subject, type: :model do
    before do
      teacher  = FactoryBot.create(:teacher)
      subject1 = FactoryBot.create(:subject, subject_title: "心理学", teacher_id: teacher.id)
      subject2 = FactoryBot.create(:subject, teacher_id: teacher.id)
      subject3 = FactoryBot.create(:subject, teacher_id: teacher.id)
   end

   describe "ransackの検索が正常に動くか" do
    it "心理学を入力したらsubject1が含まれる" do 
      expect(Subject.search("心理学")).to include(subject1)
    end
  end  
end

