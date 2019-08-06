class ApplicationController < ActionController::Base
  def home
  end

  def backend
    @coasters = Coaster.all
    @working_cards = WorkingCard.all
  end
end
