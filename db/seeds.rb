# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Branch.create(branch_name_en: 'Designer', branch_name_ru: 'Разработчик', branch_name_uk: 'Розробник')

# Organization.create(name: 'Karpenko Viaceslav', subordinated: 'Differ', country: 'Україна', state: 'Черкаська', region: 'Черкаський', town: 'Черкаси', street: 'Тараса Шевченка бульвар', build: '11', block: 'Б', office: '12', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_unit_id: '1', branch_id: '1')

# Departament.create(departament_name: 'Roles', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '1', branch_id: '1', organization_id: '1')

# Departament.create(departament_name: 'Second departament', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '', branch_id: '1', organization_id: '1')

# Unit.create(name: 'global_admin', surename: 'Surename', patronymic: 'patronymic', subordinated: '-', post: 'main', email: '1@1', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: true, public_for_departament: true)

# Unit.create(name: 'global_moderator', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '2@2', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Unit.create(name: 'organization_admin', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '3@3', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Unit.create(name: 'organization_moderator', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '4@4', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Unit.create(name: 'departament_admin', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post:'main', email: '5@5', secondary_email: '1@1', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Unit.create(name: 'departament_moderator', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '6@6', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Unit.create(name: 'user', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '7@7', secondary_email: '1@11', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1', public_for_organization: false, public_for_departament: false)

# Organization.create(name: 'Test', subordinated: '', country: 'Україна', state: 'Черкаська', region: 'Черкаська', town: 'Черкаси', street: 'Тараса Шевченка бульвар', build: '11', block: 'Б', office: '12', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_unit_id: '8', branch_id: '1')

# Departament.create(departament_name: 'Test departament', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '8', branch_id: '1', organization_id: '2')

# Unit.create(name: 'Oksana', surename: 'Karpenko', patronymic: 'Mikolaivna', subordinated: 'departament_moderator', post: 'main', email: '8@8', secondary_email: '11@11', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_admin', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '3', public_for_organization: true, public_for_departament: true)

# Unit.create(name: 'Name', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '9@9', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '3', public_for_organization: false, public_for_departament: false)

# Departament.create(departament_name: 'Test departament2', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', public_unit_id: '10', branch_id: '1', organization_id: '2')

# Unit.create(name: 'user1O2D1', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '10@10', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '4', public_for_organization: false, public_for_departament: true)

# Unit.create(name: 'user2O2D1', surename: 'Surename', patronymic: 'patronymic', subordinated: 'departament_moderator', post: 'main', email: '11@11', secondary_email: '1@11111', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '4', public_for_organization: false, public_for_departament: true)

Info.create(great_header_en: 'Hello in my info page!!!', great_header_ru: 'Приветствую Вас на странице информации!', great_header_uk: 'Вітаю Вас на сторінці інформації!', header_en: 'What is it?', header_ru: 'Что єто?', header_uk: "Що це?\n", text_en: "Goog time for you, dear friend! My name Viacheslav and i am designer of this web site. It's my first experience of programming in ruby with using rails framework. It was created by me as traning space and improve the skills of web programming. My aim is creating phones numbers list of my colegues in different companies. Work is not finished yet and i hope my enthusiasm will not gone.   ", text_ru: 'Привет, дорогой друг! Зовут меня Вячеслав, и я автор этого веб-сайта. Это мой первый опыт программирования на руби с использованием платформы rails. Он был создан мной как пространство для тренировок и улучшения навыков веб-программирования. Моя цель - создать список телефонов моих коллег в разных компаниях. Работа еще не закончена, и я надеюсь, что мой энтузиазм не исчезнет.', text_uk: 'Привіт, любий друже! Мене звати Вячеслав і я дизайнер цього веб-сайту. Це мій перший досвід програмування на рубі з використанням Rails. Він був створений мною як трeнувальний простір та вдосконалення навичок веб-програмування. Моя мета - створити список телефонів моїх колег у різних компаніях. Робота ще не завершена, і я сподіваюсь, що мій ентузіазм не зникне.', myPhoto: '')

Branch.create!(branch_name_en: 'Agriculture, Forestry and Fisheries', branch_name_ru: 'Сельское хозяйство, лесное хозяйство и рыбное хозяйство', branch_name_uk: 'Сільське господарство, лісове господарство та рибне господарство')

Branch.create!(branch_name_en: 'Mining and quarrying', branch_name_ru: 'Добывающая промышленность и разработка карьеров', branch_name_uk: 'Добувна промисловість і розроблення кар\'єрів')

Branch.create!(branch_name_en: 'Manufacturing industry', branch_name_ru: 'Перерабатывающая промышленность', branch_name_uk: 'Переробна промисловість')

Branch.create!(branch_name_en: 'Supply of electricity, gas, steam and air conditioning', branch_name_ru: 'Поставка электроэнергии, газа и кондиционированного воздуха', branch_name_uk: 'Постачання електроенергії, газу, пари та кондиційованого повітря')

Branch.create!(branch_name_en: 'Water supply; sewage, waste management', branch_name_ru: 'Водоснабжения; канализация, обращение с отходами', branch_name_uk: 'Водопостачання; каналізація, поводження з відходами')

Branch.create!(branch_name_en: 'Construction', branch_name_ru: 'Строительство', branch_name_uk: 'Будівництво')

Branch.create!(branch_name_en: 'Wholesale and retail trade; repair of motor vehicles and motorcycles', branch_name_ru: 'Оптовая и розничная торговля; ремонт автотранспортных средств и мотоциклов', branch_name_uk: 'Оптова та роздрібна торгівля; ремонт автотранспортних засобів і мотоциклів')

Branch.create!(branch_name_en: 'Transport, warehousing, postal and courier activities', branch_name_ru: 'Транспорт, складское хозяйство, почтовая и курьерская деятельность', branch_name_uk: 'Транспорт, складське господарство, поштова та кур\'єрська діяльність')

Branch.create!(branch_name_en: 'Temporary placement and organization of food', branch_name_ru: 'Временное размещения и организация питания', branch_name_uk: 'Тимчасове розміщування й організація харчування')

Branch.create!(branch_name_en: 'Information and telecommunications', branch_name_ru: 'Информация и телекоммуникации', branch_name_uk: 'Інформація та телекомунікації')

Branch.create!(branch_name_en: 'Financial and insurance activities', branch_name_ru: 'Финансовая и страховая деятельность', branch_name_uk: 'Фінансова та страхова діяльність')

Branch.create!(branch_name_en: 'Real estate operations', branch_name_ru: 'Операции с недвижимым имуществом', branch_name_uk: 'Операції з нерухомим майном')

Branch.create!(branch_name_en: 'Professional, scientific and technical activities', branch_name_ru: 'Профессиональная, научная и техническая деятельность', branch_name_uk: 'Професійна, наукова та технічна діяльність')

Branch.create!(branch_name_en: 'Activity in the field of administrative and auxiliary services', branch_name_ru: 'Деятельность в сфере административного и вспомогательного обслуживания', branch_name_uk: 'Діяльність у сфері адміністративного та допоміжного обслуговування')

Branch.create!(branch_name_en: 'Public administration and defense; compulsory social insurance', branch_name_ru: 'Государственное управление и оборона; обязательное социальное страхование', branch_name_uk: 'Державне управління й оборона; обов\'язкове соціальне страхування')

Branch.create!(branch_name_en: 'Education', branch_name_ru: 'Образование', branch_name_uk: 'Освіта')

Branch.create!(branch_name_en: 'Health care and social assistance', branch_name_ru: 'Здравоохранение и предоставление социальной помощи', branch_name_uk: 'Охорона здоров\'я та надання соціальної допомоги')

Branch.create!(branch_name_en: 'Arts, sports, entertainment and recreation', branch_name_ru: 'Искусство, спорт, развлечения и отдых', branch_name_uk: 'Мистецтво, спорт, розваги та відпочинок')

Branch.create!(branch_name_en: 'Provision of other types of services', branch_name_ru: 'Предоставление других видов услуг', branch_name_uk: 'Надання інших видів послуг')

Branch.create!(branch_name_en: 'Activities of households', branch_name_ru: 'Деятельность домашних хозяйств', branch_name_uk: 'Діяльність домашніх господарств')

Branch.create!(branch_name_en: 'Activities of extraterritorial organizations and bodies', branch_name_ru: 'Деятельность экстерриториальных организаций и органов', branch_name_uk: 'Діяльність екстериторіальних організацій і органів')
