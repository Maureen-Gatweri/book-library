class LendingsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    lending = book.lendings.new(lending_params.merge(borrowed_at: Time.now))

    if lending.save
      redirect_to book, notice: "Book borrowed by #{lending.borrower_name}!"
    else
      redirect_to book, alert: "Error borrowing book."
    end
  end

  def update
    lending = Lending.find(params[:id])
    lending.update(returned_at: Time.now)
    redirect_to lending.book, notice: "Book has been returned!"
  end

  def borrower_history
    @borrower_name = params[:borrower_name]
    @lendings = Lending.where(borrower_name: @borrower_name).includes(:book)
  end

  private

  def lending_params
    params.require(:lending).permit(:borrower_name)
  end
end
