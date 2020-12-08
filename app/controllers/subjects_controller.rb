class SubjectsController < ApplicationController

  before_action :search_subject, only: [:index, :search]

  def index
    @subjects = Subject.all 
  end

  def search
    @results = @p.result
  end

  private

  def search_subject
    @p = Subject.ransack(params[:q]) 
  end
end
