# frozen_string_literal: true

class ShoppingOrder < ApplicationRecord
  belongs_to :provider
end
