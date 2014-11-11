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
    subject { get :show, id: localization.id, locale: locale.locale, format: :json}

    it_behaves_like :http_success

    it { is_expected.to render_serializer LocaleSerializer }
  end

  describe "POST create" do
    include_context :write_token


  end

  describe "PUT update" do
    include_context :write_token

   end

  describe "DEL destroy" do
    include_context :write_token

  end

  describe "GET uuid" do
  end
end
