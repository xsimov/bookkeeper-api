# frozen_string_literal: true

class Calendar
  def initialize(parameters)
    @parameters = parameters
  end

  def build
    ShoppingOrder.all.where(estimated_arrival_at: Date.yesterday..4.weeks.from_now)
  end
end
