class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new; end

  def create
    redirect_to lines_path if @line = Line.new(line_params).save
  end

  def edit
    if @line = Line.find(params[:id])
    end
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
end
