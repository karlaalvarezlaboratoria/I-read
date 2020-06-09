# frozen_string_literal: true

module Library
  class PublishersController < ApplicationController
    before_action :authenticate_account!
    before_action :find_publisher, only: %i[edit update destroy]

    def index
      @publishers = Publisher.all.order(:name)
    end

    def new
      @publisher = Publisher.new
    end

    def create
      @publisher = Publisher.new(publisher_params)
      @publisher.save

      respond_with :library, @publisher
    end

    def edit; end

    def update
      @publisher.update(publisher_params)
      respond_with :library, @publisher
    end

    private

    def publisher_params
      params.require(:publisher).permit(:name, :country)
    end

    def find_publisher
      @publisher = Publisher.find(params[:id])
    end
  end
end
