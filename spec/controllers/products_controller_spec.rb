require 'rails_helper'

describe ProductsController do
  describe 'GET#index' do
    it 'renders the :index template' do
      products = create_list(:product, 5)
      get :index
      expect(response).to render_template :index
    end

    it 'the request will be 200 ok'  do
        expect(response.status).to eq 200
    end
  end
end
