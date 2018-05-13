class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "ありがとうございますレビューを投稿しました"
    else
      redirect_to books_path(@book),alert: "申し訳ありません投稿に失敗しました"
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
	     redirect_to book_path(@book), notice: "レビューを編集しました"
    else
       redirect_to edit_book_path(@book), alert: "申し訳ありません編集に失敗しました"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "レビューを削除しました"
      redirect_to books_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to books_path
    end
  end
  
  private
  	def book_params
  		params.require(:book).permit(:title, :body)
  	end
end