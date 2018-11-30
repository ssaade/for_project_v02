require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comments) }

    it { should have_many(:slots) }

    end

    describe "InDirect Associations" do

    it { should have_many(:received_matches) }

    end

    describe "Validations" do
      
    end
end
