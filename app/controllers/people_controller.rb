class PeopleController < ApplicationController
  before_action :setup, except: :show

  def index
  end

  def fetch
    respond_to :js
  end

  def show
    @person = Person.find params[:id]
  end

  private

  def setup
    @pages_n = Person.pages_number params[:per_page]
    @page = params[:page] || 1 # first page by default
    @people = Person.page @page, params[:per_page]
  end
end
