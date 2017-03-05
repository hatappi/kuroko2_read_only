require 'rails_helper'
require 'kuroko2'

describe Kuroko2ReadOnly::SettingsController, type: :controller do
  include SignInHelper

  routes { Kuroko2ReadOnly::Engine.routes }

  before { sign_in }

  describe 'GET show' do
    it 'response ok' do
      get :show
      expect(response).to be_ok
    end
  end

  describe 'POST update' do
    let(:params) {
      {
        users: {
          '1': {
            read_only: '1'
          }
        }
      }
    }
    it 'redirects settings_path' do
      post :update, params: params
      expect(response).to redirect_to(settings_path)
    end
  end
end