require 'rails_helper'

RSpec.describe Api::LocalizationsController, :type => :controller do
  describe "GET index" do
    context 'with a public token scope' do
      let(:token) do
        dbl = double
        allow(dbl).to receive(:acceptable?).and_return true
        allow(dbl).to receive(:scopes).and_return [:public]
        dbl
      end

      before do
        allow(controller).to receive(:doorkeeper_token).and_return token
      end

      it "returns http success" do
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end

      context 'when populated' do
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
end
