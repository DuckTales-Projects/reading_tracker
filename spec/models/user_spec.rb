# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.validations' do
    subject(:create_user) { create(:user) }

    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
