require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:favorites) }

    it { should have_many(:reviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
