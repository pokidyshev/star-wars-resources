class PeopleController < ApplicationController
  before_action :setup, except: :show

  def index
    @pages_n = Person.pages_number 8
  end

  def fetch
    respond_to :js
  end

  def show
    @person = Person.find params[:id]
  end

  private

  def setup
    @people = Person.page(params[:page], 8)
  end
end
