require 'rails_helper'

RSpec.describe Appointment, type: :model do
    before do
        @user = User.create(email: 'sam@outlook.com', password: 'password',
                            password_confirmation: 'password')
        @appointment = Appointment.create(title:'appointment1', description: 'appointment test description',
             start_time: DateTime.now, end_time: DateTime.now + 1.hours, user: @user)
        @user.appointments << @appointment
      end

  context 'Test model validations' do
    it 'is valid with valid attributes' do
      expect(@appointment).to be_valid
    end

    it 'end_time should be greater than start_time' do
        @appointment.end_time = @appointment.start_time
        expect(@appointment).to_not be_valid
      end

    it 'title should be present' do
      @appointment.title = nil
      expect(@appointment).to_not be_valid
    end

    it 'description should be present' do
        @appointment.description = nil
        expect(@appointment).to_not be_valid
    end

    it 'start_time should be present' do
        @appointment.start_time = nil
        expect(@appointment).to_not be_valid
    end

    it 'end_time should be present' do
        @appointment.end_time = nil
        expect(@appointment).to_not be_valid
    end
  end

  context "Test model associations" do 
    
    it "belongs to a user" do 
      expect(@appointment.user.email).to eq('sam@outlook.com')
    end
    
  end 

  
end