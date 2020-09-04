class PilotsController < ApplicationController
  def index
    @pilots = User.all_pilots Settings.user.default_enum_pilot
  end
end
