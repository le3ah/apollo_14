class AstronautsController < ApplicationController
  def new
    @astronaut = Astronaut.new
  end

  def index
    @astronauts = Astronaut.all
  end
end
