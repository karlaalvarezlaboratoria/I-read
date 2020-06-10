# frozen_string_literal: true

class BookshelvesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_bookshelf, only: %i[edit update destroy valid_account]

  def index
    @bookshelves = Bookshelf.all.order(:name)
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
    return unless valid_account?

    @bookshelf.update(bookshelf_params)
    respond_with @bookshelf
  end

  private

  def bookshelf_params
    params.require(:bookshelf).permit(:name, :description, book_ids: [])
  end

  def find_bookshelf
    @bookshelf = Bookshelf.find(params[:id])
  end

  def valid_account?
    @bookshelf.account_id == current_account.id
  end
end
