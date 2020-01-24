require 'rails_helper'

describe Item do
  it { should have_and_belong_to_many(:characters) }
end

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
