class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end
  
  def new
    @movie_theater = MovieTheater.find(params[:movie_theater_id])
    @session = @movie_theater.rooms.build
  end
  
  def create
    @movie_theater = MovieTheater.find(params[:movie_theater_id])
    @session = @movie_theater.rooms.build(sessions_params)
    
    if @session.save
      redirect_to @session, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  
  private

  def sessions_params
    params.require(:session).permit(:date, :time)
  end
end
