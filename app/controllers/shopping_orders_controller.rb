# frozen_string_literal: true

class ShoppingOrdersController < ApplicationController
  def index
    render json: Calendar.new(params).build
  end

  def show
    render json: ShoppingOrder.find(params[:id])
  end

  def create
    ShoppingOrder.create(shopping_order_params.merge(ordered_at: Time.current))
    render json: {}, status: :created
  end

  private

  def shopping_order_params
    params
      .require(:shopping_order)
      .permit(:provider_id, :description, :estimated_price_in_cents, :estimated_arrival_at)
  end
end
