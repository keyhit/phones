FactoryBot.define do
  factory :unit do
    name                    'Viacheslav'
    surename                'Karpenko'
    patronymic              'Jurievich'
    subordinated            'no'
    subordinated_id         nil
    post                    '123456s'
    email                   'viacheslavkarpenkoju@gmail.com'
    secondary_email         nil
    password '123456789'
    primary_phone_number    '+380969490444'
    secondary_phone_number  '+380969490444'
    short_phone_nunber      nil
    fax                     '+380969490444'
    home_phone_number       '+380969490444'
    web_page                'https://www.facebook.com/viacheslav.karpenko.75'
    start_work              '08:30'
    finish_work             '17:00'
    working_days            'Mon-Fri'
    birthday                nil
    unitphoto               nil
    characteristic          nil
    role                    'global_admin'
    locale                  'uk'
    hidden                  nil
    blocked                 nil
    public_for_organization true
    public_for_departament  true
    # branch_id               1
    # organization_id         1
    # departament_id          1
  end
end
