require 'rails_helper'

class RequestHandlerController < Kuroko2ReadOnly::ApplicationController
  include Kuroko2ReadOnly::RequestHandler
  def index
    head :ok
  end

  def create
    head :ok
  end
end

RSpec.describe RequestHandlerController, type: :controller do
  include SignInHelper
  before do
    sign_in
    Kuroko2::User.first.update!(read_only: true)
    routes.draw do
      get 'index' => 'request_handler#index'
      post 'create' => 'request_handler#create'
    end
  end

  describe 'GET #index' do
    it 'response ok' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'POST #create' do
    it 'raise Kuroko2ReadOnly::AccessDenied' do
      expect { post :create }.to raise_error(Kuroko2ReadOnly::AccessDenied)
    end
  end
end