
require 'rails_helper'

RSpec.describe 'app/helpers/sessions_helper.rb', type: :helper do
    include SessionManager
    
    it 'tells whether a session is up or down' do
        session[:logged] = true
        expect(isLogged?).to eq true

        session[:logged] = false
        expect(isLogged?).to eq false
    end

    it 'tells who is logged' do

        kind = %i[ learner coach admin ].sample
        user = User.new name: FFaker::Name.name, username: FFaker::Internet.user_name, password: FFaker::Internet.password, kind: kind
        user.save

        session[:logged] = true
        session[:user_id] = user.id
        
        expect(current_user.id).to eq(user.id)
    end

    it 'it checks if the user matches the permission level' do

        kind = %i[ learner coach admin ].sample
        user = User.new name: FFaker::Name.name, username: FFaker::Internet.user_name, password: FFaker::Internet.password, kind: :admin
        user.save

        session[:logged] = true
        session[:user_id] = user.id
        
        expect(hasPermission? :learner, :admin, :coach).to eq true
        expect(hasPermission?).to eq(false)
        expect(hasPermission? :coach, :learner).to eq false
    end

    it 'logs a user' do
        user = User.new name: FFaker::Name.name, username: FFaker::Internet.user_name, password: FFaker::Internet.password, kind: :admin, id: 12345
        login user
        expect(session[:logged]).to eq true
        expect(session[:user_id]).to eq 12345
    end

    it 'logs out' do
        session[:logged] = true
        session[:user_id] = 123456
        logout
        expect(session[:logged]).to eq false
        expect(session[:user_id]).to be_nil
    end
end