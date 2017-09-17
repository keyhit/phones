  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Branch.create(branch_name: 'Designer')

Organization.create(name: 'Karpenko Viaceslav', subordinated: 'Differ', country: 'Україна', state: 'Черкаська', region: 'Черкаський', town: 'Черкаси', street: 'Тараса Шевченка бульвар', build: '11', block: 'Б', office: '12', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_unit_id: '1', branch_id: '1')



Departament.create(departament_name: 'Roles', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '1', branch_id: '1', organization_id: '1')

Departament.create(departament_name: 'Second departament', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '', branch_id: '1', organization_id: '1')


Unit.create(name: 'global_admin', surename: 'Surename', patronimic: 'Patronimic', subordinated: '-', post: 'main', email: '1@1', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: true, public_for_departament: true)

Unit.create(name: 'global_moderator', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '2@2', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Unit.create(name: 'organization_admin', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '3@3', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Unit.create(name: 'organization_moderator', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '4@4', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Unit.create(name: 'departament_admin', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post:'main', email: '5@5', secondary_email: '1@1', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Unit.create(name: 'departament_moderator', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '6@6', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Unit.create(name: 'user', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '7@7', secondary_email: '1@11', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

Organization.create(name: 'Test', subordinated: '', country: 'Україна', state: 'Черкаська', region: 'Черкаська', town: 'Черкаси', street: 'Тараса Шевченка бульвар', build: '11', block: 'Б', office: '12', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_unit_id: '8', branch_id: '1')

Departament.create(departament_name: 'Test departament', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '8', branch_id: '1', organization_id: '2')

Unit.create(name: 'Oksana', surename: 'Karpenko', patronimic: 'Mikolaivna', subordinated: 'departament_moderator', post: 'main', email: '8@8', secondary_email: '11@11', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_admin', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '3', public_for_organization: true, public_for_departament: true)

Unit.create(name: 'Name', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '9@9', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '3', public_for_organization: false, public_for_departament: false)

Departament.create(departament_name: 'Test departament2', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '10', branch_id: '1', organization_id: '2')

Unit.create(name: 'user1O2D1', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '10@10', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '4', public_for_organization: false, public_for_departament: true)

Unit.create(name: 'user2O2D1', surename: 'Surename', patronimic: 'Patronimic', subordinated: 'departament_moderator', post: 'main', email: '11@11', secondary_email: '1@11111', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '4', public_for_organization: false, public_for_departament: true)

Info.create(header: "Article header", text: "Goog time for you, dear friend! My name Viacheslav and i am designer of this web site. It's my first experience of programming in ruby with using rails framework. It was created by me as traning space and improve the skills of web programming. My aim is creating phones numbers list of my colegues in different companies. Work is not finished yet and i hope my enthusiasm will not gone.   ", myPhoto: "image/upload/v1503850725/oqmj1ku94y5onqvseya0.jpg")

# Branch.create(branch_name: 'Сільське господарство, лісове господарство та рибне господарство')
# Branch.create(branch_name: 'Добувна промисловість і розроблення кар\'єрів')
# Branch.create(branch_name: 'Переробна промисловість')
# Branch.create(branch_name: 'Постачання електроенергії, газу, пари та кондиційованого повітря')
# Branch.create(branch_name: 'Водопостачання; каналізація, поводження з відходами')
# Branch.create(branch_name: 'Будівництво')
# Branch.create(branch_name: 'Оптова та роздрібна торгівля; ремонт автотранспортних засобів і мотоциклів')
# Branch.create(branch_name: 'Транспорт, складське господарство, поштова та кур\'єрська діяльність')
# Branch.create(branch_name: 'Тимчасове розміщування й організація харчування')
# Branch.create(branch_name: 'Інформація та телекомунікації')
# Branch.create(branch_name: 'Фінансова та страхова діяльність')
# Branch.create(branch_name: 'Операції з нерухомим майном')
# Branch.create(branch_name: 'Професійна, наукова та технічна діяльність')
# Branch.create(branch_name: 'Діяльність у сфері адміністративного та допоміжного обслуговування')
# Branch.create(branch_name: 'Державне управління й оборона; обов\'язкове соціальне страхування')
# Branch.create(branch_name: 'Освіта')
# Branch.create(branch_name: 'Охорона здоров\'я та надання соціальної допомоги')
# Branch.create(branch_name: 'Мистецтво, спорт, розваги та відпочинок')
# Branch.create(branch_name: 'Надання інших видів послуг')
# Branch.create(branch_name: 'Діяльність домашніх господарств')
# Branch.create(branch_name: 'Діяльність екстериторіальних організацій і органів')

Branch.create!(branch_name: 'Agriculture, Forestry and Fisheries')
Branch.create!(branch_name: 'Mining and quarrying')
Branch.create!(branch_name: 'Manufacturing industry')
Branch.create!(branch_name: 'Supply of electricity, gas, steam and air conditioning')
Branch.create!(branch_name: 'Water supply; sewage, waste management')
Branch.create!(branch_name: 'Construction')
Branch.create!(branch_name: 'Wholesale and retail trade; repair of motor vehicles and motorcycles')
Branch.create!(branch_name: 'Transport, warehousing, postal and courier activities')
Branch.create!(branch_name: 'Temporary placement and organization of food')
Branch.create!(branch_name: 'Information and telecommunications')
Branch.create!(branch_name: 'Financial and insurance activities')
Branch.create!(branch_name: 'Real estate operations')
Branch.create!(branch_name: 'Professional, scientific and technical activities')
Branch.create!(branch_name: 'Activity in the field of administrative and auxiliary services')
Branch.create!(branch_name: 'Public administration and defense; compulsory social insurance')
Branch.create!(branch_name: 'Education')
Branch.create!(branch_name: 'Health care and social assistance')
Branch.create!(branch_name: 'Arts, sports, entertainment and recreation')
Branch.create!(branch_name: 'Provision of other types of services')
Branch.create!(branch_name: 'Activities of households')
Branch.create!(branch_name: 'Activities of extraterritorial organizations and bodies')
