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
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def character_params
      params.require(:character).permit(:name, :description)
    end
  end
  