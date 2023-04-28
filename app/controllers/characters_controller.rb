class CharactersController < ApplicationController
  before_action :set_book

  def new
    @character = @book.characters.new
  end

  def create
    @character = @book.characters.new(character_params)

    if @character.save
      redirect_to @book, notice: 'Character was successfully added.'
    else
      render :new
    end
  end

  def index
    @characters = @book.characters
  end

  def edit
    @character = @book.characters.find(params[:id])
  end

  def update
    @character = @book.characters.find(params[:id])

    if @character.update(character_params)
      flash[:notice] = "Character successfully updated"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Error updating character"
      render 'edit'
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description)
  end

  def set_book
    @book = current_user.books.find(params[:book_id])
  end
end
