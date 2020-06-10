# frozen_string_literal: true

class BookshelvesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_bookshelf, only: %i[edit update destroy]

  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render html: exception, status: 404
  end

  def index
    @bookshelves = current_account.bookshelves.order(:name)
  end

  def new
    @bookshelf = Bookshelf.new
  end

  def create
    @bookshelf = Bookshelf.new(bookshelf_params)
    @bookshelf.account_id = current_account.id
    @bookshelf.save

    respond_with @bookshelf
  end

  def edit; end

  def update
    @bookshelf.update(bookshelf_params)
    respond_with @bookshelf
  end

  private

  def bookshelf_params
    params.require(:bookshelf).permit(:name, book_ids: [])
  end

  def find_bookshelf
    @bookshelf = current_account.bookshelves.find(params[:id])
  end
end
