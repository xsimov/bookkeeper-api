# frozen_string_literal: true

class ShoppingOrdersController < ApplicationController
  def create
    ShoppingOrder.create(shopping_order_params.merge(ordered_at: Time.zone.now))
    render json: {}, status: :created
  end

  private

  def shopping_order_params
    params
      .require(:shopping_order)
      .permit(:provider_id, :description, :estimated_price_in_cents, :estimated_arrival_at)
  end
end
