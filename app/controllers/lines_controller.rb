class LinesController < ApplicationController
  before_action :all_lines, only: [:index, :create]
  respond_to :html, :js

  def index
    @lines = Line.all
  end

  def new
  @line = Line.new
  end

  def create
    if @line = Line.create(line_params)
      redirect_to lines_path
    end
  end

  def edit
    if @line = Line.find(params[:id])
    end
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      redirect_to lines_path
    end
  end

  def destroy
    @line = Line.find(params[:id])
    if @line.destroy
      redirect_to lines_path
    end
  end

  private
    def line_params
      params.require(:line).permit(:rec)
    end

    def all_lines
      @lines = Line.all
    end
end
