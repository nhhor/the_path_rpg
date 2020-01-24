require 'rails_helper'

describe Character do
  it { should have_and_belong_to_many(:items) }
end

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
