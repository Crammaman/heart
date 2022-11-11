class DashboardController < ApplicationController
  def show
    @cards = Card.all
  end
end
