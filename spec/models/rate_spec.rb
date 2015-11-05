require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { should belong_to :rateable }
  it { should have_many :posts}
  it { should have_many :topics}
  
end