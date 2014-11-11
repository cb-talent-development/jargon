require 'rails_helper'

RSpec.describe Localization, :type => :model do
  context '#new' do
    it 'requires a name' do
      localization = build(:localization, :without_name)
      expect(localization.save).to be_falsey
    end
    it 'requires an owner' do
      localization = build(:localization, :without_owner)
      expect(localization.save).to be_falsey
    end
    it 'does not allow duplicate names' do
      localization = create(:localization)
      dupe = build(:localization, name: localization.name)
      expect(dupe.save).to be_falsey
    end
  end
end
