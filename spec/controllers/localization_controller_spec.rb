require 'rails_helper'

RSpec.describe Api::LocalizationsController, :type => :controller do
  describe "GET index" do
    include_context :public_token
    subject!        { get :index, format: :json }
    it_behaves_like :http_success

    context 'when populated' do
      let(:localizations) { Localization.all }
      before :context do
        3.times { create(:localization) }
      end

      it 'includes all localizations' do
        expect(assigns(:localizations)).to match_array localizations
      end
    end

    context 'without a token' do
      let(:token) { nil }
      it "returns unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET show" do
    include_context :public_token
    let(:localization) { create(:localization)}
    subject { get :show, id: localization.id, format: :json}

    it_behaves_like :http_success

    it { is_expected.to render_serializer LocalizationSerializer }
  end

  describe "POST create" do
    include_context :public_token
    let(:new_localization) { attributes_for(:localization) }

    it 'should redirect' do
      expect(post :create, {localization: new_localization }, { :'Content-Type' => 'application/json'}).to be_a_redirection
    end
    it 'should increment Localization.count by 1' do
      expect{post :create, {localization: new_localization }, { :'Content-Type' => 'application/json'}}.to change(Localization, :count).by 1
    end
  end

  describe "PUT update" do
    include_context :public_token

    it 'should change the name' do
      localization = create(:localization)
      put :update, { id: localization.id, localization: { name: "New Name" } }, { :'Content-Type' => 'application/json'}
      expect(Localization.find(localization.id).name).to eq "New Name"
    end

    it 'should redirect' do
      localization = create(:localization)
      expect(put :update, { id: localization.id, localization: {name: "New Name"}}, { :'Content-Type' => 'application/json'}).to be_a_success
    end

    it 'should NOT change Localization.count' do
      localization = create(:localization)
      expect { put :update, { id: localization.id, localization: {name: "New Name"}}, { :'Content-Type' => 'application/json'}}.not_to change(Localization, :count)
    end
  end

  describe "DEL destroy" do
    include_context :public_token

    it 'should be a redirection' do
      localization = create(:localization)
      expect(delete :destroy, id: localization.id, format: :json).to be_a_redirection
    end

    it 'should delete the Localization' do
      localization = create(:localization)
      delete :destroy, id: localization.id, format: :json
      expect(Localization.exists?(localization.id)).to be_falsey
    end

    it 'should decrease the Localization.count by 1' do
      localization = create(:localization)
      expect { delete :destroy, id: localization.id, format: :json }.to change(Localization, :count).by -1
    end
  end

  describe "GET uuid" do
    let(:localization) { create(:localization) }
    subject! { get :lookup_by_uuid, uuid: localization.uuid, format: :json }

    it_behaves_like :http_success

    it { is_expected.to render_serializer LocalizationSerializer }
  end
end
