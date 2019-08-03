class ApplicationController < ActionController::Base
  def home
  end

  def backend
    debugger
    @coasters = Coaster.all
    @working_cards = WorkingCard.all
  end
end
