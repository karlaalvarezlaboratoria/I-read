# frozen_string_literal: true

module ReviewsHelper
  def average
    if @book_review_average
      @average
    else
      'N/A'
    end
  end
end
