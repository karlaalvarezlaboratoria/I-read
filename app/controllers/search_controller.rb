# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    word = "%#{params[:keyword]}%"
    @search = Book.where('title ILIKE ? OR description ILIKE ?', word, word)

    respond_with @search
  end

  def show; end

  def create; end
end
