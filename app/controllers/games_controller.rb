class GamesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def console_list
  end
end
