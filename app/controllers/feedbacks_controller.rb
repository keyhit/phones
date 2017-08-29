class FeedbacksController < ApplicationController
  before_action :authenticate_unit!
  def new; end

  def send_feedback
    @message_sender = current_unit.email
    @subject = feedback_params[:subject]
    @body = feedback_params[:body]
    @file_name = feedback_params[:file].original_filename
    @file_path = feedback_params[:file].tempfile
    # binding.pry
    if FeedbackMailer.feedback(@subject, @body, @message_sender, @file_name, @file_path).deliver_now
      flash[:notice] = 'Mail has sent!'
      redirect_to branches_path()
    else
      flash[:error] = 'Eror sending email!'
      redirect_to new_feedback_path()
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:subject, :body, :file)
    end
end
