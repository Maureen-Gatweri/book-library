require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url
    assert_response :success
  end
end


class BooksController < ApplicationController
  def index
    @books = Book.all
  end
end
