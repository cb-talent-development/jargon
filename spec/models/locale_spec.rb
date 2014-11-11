require 'rails_helper'

RSpec.describe Locale, :type => :model do

  let(:localization) { create(:localization) }
  let(:another_localization) { create(:localization) }
  let(:locale) { create(:locale) }
  let(:new_data) { { 'Key1' => "New Value", 'Key2' => "Other New Value" } }

  describe '#new' do
    it 'prevents duplicates on a single localizations' do
      localization.locales << locale
      expect(localization.locales << build(:locale, name: locale.name)).to be_falsey
    end

    it 'allows the same name across localizations' do
      localization.locales << locale
      expect(another_localization.locales << build(:locale, name: locale.name)).to be_truthy
    end
  end

  describe '#json' do
    it 'outputs the Data field as JSON' do
      expect(locale.json).to eq(locale.data.to_json)
    end
  end

  describe '#json=' do
    it 'saves JSON to the Data field' do
      locale.json = new_data.to_json
      expect(locale.data).to eq new_data
    end
  end

  describe '#yaml' do
    it 'outputs the Data field as YAML' do
      expect(locale.yaml).to eq(locale.data.to_yaml)
    end
  end

  describe '#yaml=' do
    it 'saves YAML to the Data field' do
      locale.yaml = new_data.to_yaml
      expect(locale.data).to eq new_data
    end
  end
end
