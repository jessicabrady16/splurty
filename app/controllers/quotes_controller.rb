class QuotesController < ApplicationController
  def index
  @quote = Quote.order("RANDOM()").first
  end
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is either too short (less than 3 characters) or too long (more than 350 characters).'
    end
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
    end
end
