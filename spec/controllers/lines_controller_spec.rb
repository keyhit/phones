require 'rails_helper'
require 'support/factory_bot'

RSpec.describe LinesController, type: :controller do
  describe 'GET #index' do
    it 'Lines index has 200 status' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    it 'Lines new has 200 status' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'Post #create' do
    it 'Lines create has 302 status' do
      post :create, params: { line: { rec: 'test rec#1' } }
      expect(response.content_type).to eq 'text/html'
      expect(response.status).to eq(302)
    end
  end

  describe 'GET #show' do
    it 'Lines show has response 200 status' do
      line = create(:line)
      get :show, params: { id: line.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    it 'has status 200 ' do
      line = create(:line)
      get :edit, params: { id: line.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'PATCH #update' do
    it 'has change rec' do
      line = create(:line)
      patch :update, params: { id: line.id , line: { rec: 'Edited rec'}}
      line.reload
      expect(line.rec).to eq('Edited rec')
    end
  end

  describe 'DELETE #destroy' do
    it 'Lines destroy' do
      line = create(:line)
      delete :destroy, params: { id: line.id }
      expect(subject).to redirect_to lines_url
    end
  end
end
