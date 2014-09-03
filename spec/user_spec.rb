require 'rails_helper'

describe User do

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :email }
  it { should ensure_length_of(:name).is_at_least 4 }
  it { should ensure_length_of(:name).is_at_most 12 }
  it { should ensure_length_of(:email).is_at_least 6 }
  it { should ensure_length_of(:email).is_at_most 32 }

end
