require 'rails_helper'

describe Message do
  it { should belong_to(:user) }
end