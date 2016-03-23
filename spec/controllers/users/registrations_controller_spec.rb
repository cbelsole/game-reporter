require 'rails_helper'

RSpec.describe Users::RegistrationsController do
  describe 'POST /users/registrations' do
    it 'creates a default user' do
      post :create, user: { email: 'test1@test.com', password: 'testtest', password_confirmation: 'testtest', role: 'host' }

      expect(User.count).to eq(1)
    end

    it 'creates a host user' do
    end

    it 'does not create an admin' do
    end
  end
end
