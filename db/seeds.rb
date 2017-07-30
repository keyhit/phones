# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Branch.create(branch_name: "Designer")

Branch.create(branch_name: "Example")

Organization.create(name: "Karpenko Viaceslav", address: 'My_city My_street', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_presentation_user_id: '', branch_id: '1')

Organization.create(name: "Differ", address: 'My_city My_street', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_presentation_user_id: '', branch_id: '1')

Organization.create(name: "Example Differ", address: 'My_city My_street', web_page: 'https://www.facebook.com/', our_skils: 'Do this and that and differ very good', organizationlogotype: '', public_presentation_user_id: '', branch_id: '2')

Departament.create(departament_name: 'Roles', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', branch_id: '1', organization_id:'1')

Departament.create(departament_name: 'Differ d1', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', branch_id: '1', organization_id:'2')

Departament.create(departament_name: 'Example Differ d1', departament_description: 'Under Main', departamentlogotype: '', subordinated: 'Main', branch_id: '2', organization_id:'3')

Unit.create(full_name: 'slava_global_admin', belong_to_departament: 'Departament 1', post: 'main', email: '1@1', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'global_moderator', belong_to_departament: 'Departament 1', post: 'main', email: '2@2', secondary_email: '1@11', password:  '111111',primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'global_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'organization_admin', belong_to_departament: 'Departament 1', post: 'main', email: '3@3', secondary_email: '1@11', password:  '111111',primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'organization_moderator', belong_to_departament: 'Departament 1', post: 'main', email: '4@4', secondary_email: '1@11', password:  '111111',primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'organization_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'departament_admin', belong_to_departament: 'Departament 1', post: 'main', email: '5@5', secondary_email: '1@1', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_admin', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'departament_moderator', belong_to_departament: 'Departament 1', post: 'main', email: '6@6', secondary_email: '1@11', password:  '111111',primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'departament_moderator', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'user', belong_to_departament: 'Departament 1', post: 'main', email: '7@7', secondary_email: '1@11', password:  '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')

Unit.create(full_name: 'user Differ d1', belong_to_departament: 'Departament 1', post: 'main', email: '1@11', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '2', departament_id: '2')

Unit.create(full_name: 'user Example Differ d1', belong_to_departament: 'Departament 1', post: 'main', email: '1@111', secondary_email: '1@11', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '2', organization_id: '3', departament_id: '3')

Unit.create(full_name: 'user Example Differ d1', belong_to_departament: 'Departament 1', post: 'main', email: '', secondary_email: '1@11111', password: '111111', primary_phone_number: '+3804454577228', secondary_phone_number: '+3804454577228', short_phone_nunber: '7117', fax: '+3804454577228', home_phone_number: '+3804454577228', web_page: 'https://www.facebook.com/', start_work: '08:30', finish_work: '17:30', working_days: 'Mon-fri', birthday: '11.11.11', unitphoto: '', characteristic: 'Do this and that and differ very good', role: 'user', subordinated: '', branch_id: '1', organization_id: '1', departament_id: '1')
