class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<div id = "error"><strong> Invalid Entry </strong></div> <p> Entries can only be a minimum of 3 or maxmimum of 140 characters.</p>'
    end
    flash[:success] = '<div id = "success"><strong> Quote Accepted! </strong></div> <p> Please click show me another quote to refresh.</p>'
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
