require 'rails_helper'

RSpec.describe Item, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:favorites) }

    it { should have_many(:reviews) }

    it { should belong_to(:restaurant) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
