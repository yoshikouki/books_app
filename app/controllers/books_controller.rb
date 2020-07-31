# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books
  # GET /books.json
  def index
<<<<<<< HEAD
<<<<<<< HEAD
    @books = Book.page(params[:page]).per(10)
=======
    @books = Book.page(params[:page]).per(3)
>>>>>>> 2817a1c... update/ Indexページにページネートを実装
=======
    @books = Book.page(params[:page]).per(10)
>>>>>>> 282dd67... change/ Indexページネーションの単位を変更
  end

  # GET /books/1
  # GET /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(@book, notice: t('.success'))
    else
      render(:new)
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      redirect_to(@book, notice: t('.success'))
    else
      render(:edit)
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, notice: t('.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
