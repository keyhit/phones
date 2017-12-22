require 'rails_helper'
require 'support/factory_bot'

RSpec.describe UnitsController, type: :controller do
  let(:branch) { create(:branch) }
  let(:organization) { create(:organization, branch_id: branch.id) }
  let(:departament) { create(:departament, branch_id: branch.id) }
  let(:unit) { create(:unit, branch_id: branch.id, organization_id: organization.id, departament_id: departament.id) }

  before do
    sign_in unit
  end

  describe 'GET #index' do
    it 'Units index has status 200' do
      get :index, params: { branch_id: branch.id, organization_id: organization.id, departament_id: departament.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'Units show has status 200' do
      get :show, params: { branch_id: branch.id, organization_id: organization.id, departament_id: departament.id, id: unit.id }
      expect(response.status).to eq(200)
    end
  end

  # describe 'GET #registration_new_unit' do
  #   it 'renders the :registration_new_unit template' do
  #     get :registration_new_unit
  #     expect(response).to render_template :registration_new_unit
  #   end
  # end

  # describe 'GET #save_new_unit' do
  #   it '' do
  #   end
  # end

  describe 'GET #new' do
    it 'assigns a new country to @unit' do
      get :new, params: { branch_id: branch.id, organization_id: organization.id, departament_id: departament.id }
      expect(assigns(:unit)).to be_a_new(Unit)
    end

    it 'renders the :new template' do
      get :new, params: { branch_id: branch.id, organization_id: organization.id, departament_id: departament.id }
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'Create new unit' do
      it 'Create new unit' do
        post :create, params: { branch_id: branch.id, organization_id: organization.id, departament_id: departament.id, unit: { name: 'Viacheslav', surename: 'Karpenko', patronymic: 'Jurievich', subordinated: 'no', subordinated_id: nil, post: 'Chief', email: 'viacheslavkarpenkoju@gmail.com1', secondary_email: nil, password: '123456789', primary_phone_number: '+380969490444', secondary_phone_number: '+380969490444', short_phone_nunber: nil, fax: '+380969490444', home_phone_number: '+380969490444', web_page: 'https://www.facebook.com/viacheslav.karpenko.75', start_work: '08:30', finish_work: '17:00', working_days: 'Mon-Fri', birthday: nil, unitphoto: nil, characteristic: nil, role: 'global_admin', locale: 'uk', hidden: nil, blocked: nil, public_for_organization: true, public_for_departament: true } }
        expect(Unit.count).to be(2)
        expect(flash[:notice]).to match 'Unit was saved!'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(branch_organization_departament_units_path(branch, organization, departament))
      end
    end
  end

  # describe 'GET #edit' do
  #   it 'Render edit template' do
  #   binding.pry
  #     get :edit, params: {controller: units, action: 'edit', branch_id: branch.id, organization_id: organization.id, departament_id: departament.id, unit: unit.id }
  #     expect(response).to render_template :unit_edit
  #   end
  # end

  # describe 'GET #update' do
  #   it '' do
  #   end
  # end
  # describe 'GET #update_account' do
  #   it '' do
  #   end
  # end
  # describe 'GET #update_unit_branch_id' do
  #   it '' do
  #   end
  # end
  # describe 'GET #destroy' do
  #   it '' do
  #   end
  # end
  # describe 'GET #new_password' do
  #   it '' do
  #   end
  # end
  # describe 'GET #write_new_password' do
  #   it '' do
  #   end
  # end
  # describe 'GET #unit_edit' do
  #   it '' do
  #   end
  # end
  # describe 'GET #unit_edit_action' do
  #   it '' do
  #   end
  # end
  # describe 'GET #locale' do
  #   it '' do
  #   end
  # end
end
