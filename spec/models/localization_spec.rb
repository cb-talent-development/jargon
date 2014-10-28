require 'rails_helper'

RSpec.describe Localization, :type => :model do
  context '#new' do
    it 'requires a name' do
      localization = Localization.new
      expect(localization.save).to be_falsey
    end
    it 'does not allow duplicate names' do
      localization = create(:localization)
      dupe = Localization.create(name: localization.name)
      expect(dupe.save).to be_falsey
    end
  end
end
