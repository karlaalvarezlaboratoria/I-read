# frozen_string_literal: true

module Library
  class AuthorsController < ApplicationController
    before_action :authenticate_account!
    before_action :find_author, only: %i[edit update destroy]
    def index
      @authors = Author.all.order(:name)
    end

    def new
      @author = Author.new
    end

    def create
      @author = Author.new(author_params)
      @author.save

      respond_with :library, @author
    end

    def edit; end

    def update
      @author.update(author_params)
      respond_with :library, @author
    end

    private

    def author_params
      params.require(:author).permit(:name, :country, :born, :died)
    end

    def find_author
      @author = Author.find(params[:id])
    end
  end
end
