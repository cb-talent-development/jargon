require 'rails_helper'

RSpec.describe Locale, :type => :model do
  describe '#new' do
    let(:localization) { create(:localization) }
    let(:locale1) { create(:locale) }
    let(:locale2) { create(:locale, locale: "#{locale1.locale}")}
    it 'prevents duplicates on a single localizations' do
      localization.locales << locale1
      expect(localization.locales << locale2).to be_falsey
    end

    it 'allows the same name across localizations' do
      localization2 = create(:localization)
      localization.locales << locale1
      expect(localization2.locales << locale2).to be_truthy
    end
  end
end
