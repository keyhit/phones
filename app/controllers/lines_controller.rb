class LinesController < ApplicationController
  before_action :all_lines, only: %i[index create]
  respond_to :html, :js

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    redirect_to lines_path if Line.create(line_params)
  end

  def show
    @line = Line.find(params[:id])
  end

  def edit
    @line == Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    redirect_to lines_path if @line.update(line_params)
  end

  def destroy
    @line = Line.find(params[:id])
    redirect_to lines_path if @line.destroy
  end

  private

  def line_params
    params.require(:line).permit(:rec)
  end

  def all_lines
    @lines = Line.all
  end
end
