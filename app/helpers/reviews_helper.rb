# frozen_string_literal: true

module ReviewsHelper
  def average(value)
    if value
      value.round(1)
    else
      'N/A'
    end
  end
end
