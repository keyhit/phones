FactoryBot.define do
  factory :organization do
    # id                   1
    name                 'Organization name'
    subordinated         nil
    subordinated_id      nil
    country              nil
    state                nil
    region               nil
    town                 nil
    street               nil
    build                nil
    block                nil
    office               nil
    web_page             nil
    our_skils            nil
    organizationlogotype nil
    public_unit_id       nil
    hidden               nil
    blocked              nil
    # branch_id            1
  end
end