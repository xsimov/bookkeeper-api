# frozen_string_literal: true

describe 'ShoppingOrders' do
  describe 'POST /shopping_orders' do
    let(:provider_id) { create(:provider).id }
    let(:order_description) { 'ous del niu' }
    let(:price_in_cents) { 3200 }
    let(:estimated_arrival_at) { Time.zone.tomorrow.iso8601 }
    let(:frozen_moment_in_time) { Time.zone.now.iso8601 }

    let(:params) do
      {
        provider_id: provider_id,
        description: order_description,
        estimated_price_in_cents: price_in_cents,
        estimated_arrival_at: estimated_arrival_at
      }
    end

    it 'returns a 201 Created status code' do
      post shopping_orders_path, params: { shopping_order: params }, as: :json

      expect(response).to have_http_status(201)
    end

    it 'creates a ShoppingOrder with the correct params' do
      expect do
        post shopping_orders_path, params: { shopping_order: params }, as: :json
      end.to change(ShoppingOrder, :count).by(1)

      shopping_order = ShoppingOrder.last
      expect(shopping_order.description).to eq(order_description)
      expect(shopping_order.provider_id).to eq(provider_id)
      expect(shopping_order.estimated_price_in_cents).to eq(price_in_cents)
    end

    it 'sets the ordered_at field to the current timestamp' do
      travel_to(frozen_moment_in_time) do
        post shopping_orders_path, params: { shopping_order: params }, as: :json

        expect(ShoppingOrder.last.ordered_at).to eq(Time.parse(frozen_moment_in_time))
      end
    end
  end
end
