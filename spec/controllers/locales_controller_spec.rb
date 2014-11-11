require 'rails_helper'

RSpec.describe Api::LocalesController, :type => :controller do
  let(:localization) { create(:localization)}
  let(:locale) { localization.locales.first }
  before :each do
    3.times do
      localization.locales << create(:locale)
    end
  end

  describe "GET index" do
    include_context :public_token
    subject! { get :index, id: localization.id, format: :json }

    it_behaves_like :http_success

    it "returns the correct number of results" do
      expect(JSON.parse(response.body)['locales'].count).to eq 3
    end
  end

  describe "GET show" do
    include_context :public_token
    subject { get :show, id: localization.id, locale_name: locale.name, format: :json}

    it_behaves_like :http_success

    it { is_expected.to render_serializer LocaleSerializer }
  end

  describe "POST create" do
    include_context :write_token

    let(:new_locale) { attributes_for(:locale, :with_json) }

    it 'should redirect' do
      expect(post :create, {id: localization.id, locale: new_locale }, { :'Content-Type' => 'application/json'}).to be_a_redirection
    end
    it 'should increment Localization.count by 1' do
      expect{post :create, {id: localization.id, locale: new_locale }, { :'Content-Type' => 'application/json'}}.to change(localization.locales, :count).by 1
    end

  end

  describe "PUT update" do
    include_context :write_token

    it 'should change the name' do
      put :update, { id: localization.id, locale_name: locale.name, locale: { name: "New Name" } }, { :'Content-Type' => 'application/json'}
      expect(Locale.find(locale.id).name).to eq "New Name"
    end

    it 'should redirect' do
      expect(put :update, { id: localization.id, locale_name: locale.name, locale: { name: "New Name" }}, { :'Content-Type' => 'application/json'}).to be_a_redirection
    end

    it 'should NOT change Localization.count' do
      expect { put :update, { id: localization.id, locale_name: locale.name, locale: { name: "New Name" }}, { :'Content-Type' => 'application/json'}}.not_to change(Locale, :count)
    end
   end

  describe "DEL destroy" do
    include_context :write_token

    it 'should be a redirection' do
      expect(delete :destroy, id: localization.id, locale_name: locale.name, format: :json).to be_a_redirection
    end

    it 'should delete the Localization' do
      delete :destroy, id: localization.id, locale_name: locale.name, format: :json
      expect(Locale.exists?(locale.id)).to be_falsey
    end

    it 'should decrease the Localization.count by 1' do
      expect { delete :destroy, id: localization.id, locale_name: locale.name, format: :json }.to change(Locale, :count).by -1
    end
  end

  describe "GET uuid" do
    subject { get :lookup_by_uuid, uuid: localization.uuid, locale_name: locale.name, format: :json }

    it_behaves_like :http_success

    it { is_expected.to render_serializer LocaleSerializer }
  end
end
