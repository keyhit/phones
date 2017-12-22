FactoryBot.define do
  factory :departament do
    # id                      1
    departament_name        'Departament departament_name'
    departament_description 'Departament description'
    departamentlogotype     'Departament logo'
    subordinated            nil
    subordinated_id         nil
    hidden                  nil
    blocked                 nil
    public_unit_id          nil
    # branch_id               1
    # organization            1
  end
end
