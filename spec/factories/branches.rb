FactoryBot.define do
  factory :branch do
    # id              1
    branch_name_en  'Branch 1'
    branch_name_ru  'Отросль 1'
    branch_name_uk  'Галузь 1'
    subordinated    nil
    subordinated_id nil
    hidden          false
    blocked         false
  end
end
