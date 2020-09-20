# frozen_string_literal: true

class ProvidersController < ApplicationController
  def index
    render json: { collection: Provider.all }
  end

  def show
  end

  def create
    provider = Provider.create(shopping_order_params.merge(ordered_at: Time.current))

    if provider.errors.any?
      render json: { provider: provider, errors: provider.erros }, status: 422
    else
      render json: { provider: provider }, status: :created
    end
  end

  private

  def shopping_order_params
    params
      .require(:provider)
      .permit(:name, :contact_phone)
  end
end
