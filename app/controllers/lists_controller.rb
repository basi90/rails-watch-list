class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def list_params
  end

  def set_list
  end
end
