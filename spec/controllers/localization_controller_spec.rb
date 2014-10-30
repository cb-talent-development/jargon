require 'rails_helper'

RSpec.describe LocalizationsController, :type => :controller do
  describe "GET index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
    context 'with predefined objects' do
      before :context do
        3.times { create(:localization) }
      end
      let(:localizations) { Localization.all }

      it 'includes all localizations' do
        get :index, format: :json
        expect(JSON.parse(response.body)['localizations'].count).to eq 3
      end
    end
  end
end
