class InfosController < ApplicationController
    before_action :authenticate_unit!, except: %i[ index show]
  before_action :check_rules_global_admin, except: %i[index admin_branches show new create edit update destroy new_password write_new_password]
  before_action :check_rules_global_moderator, except: %i[index]
  before_action :check_rules_organization_admin, except: %i[index]
  before_action :check_rules_organization_moderator, except: %i[index]
  before_action :check_rules_departament_admin, except: %i[index]
  before_action :check_rules_departament_moderator, except: %i[index]
  before_action :check_rules_user, except: %i[index]

  def index; end

  def show 
    @info = Info.find(params[:id])
  end

  def new; end

  def create
    if Info.create(info_params)
      flash[:notice] = 'Info has been saved!'
      redirect_to infos_path()
    else
      flash[:error] = 'Info has not been saved!'
      redirect_to new_info_path()
    end
  end

  def edit; end

  def update
    if Info.update(info_params)
      flash[:notice] = 'Info has been updated!'
      redirect_to infos_path()
    else
      flash[:error] = 'Info has not been updated!'
      redirect_to new_info_path()
    end
  end

  def destroy
  if Info.destroy(params[:id])
      flash[:notice] = 'Info has been deleted!'
      redirect_to infos_path()
    else
      flash[:error] = 'Info has not been deleted!'
      redirect_to new_info_path()
    end
  end

  private 
  def info_params
    params.require(:info).permit(:great_header_en, :great_header_ru, :great_header_uk, :header_en, :text_en, :header_ru, :text_ru, :header_uk, :text_uk, :myPhoto )
  end

  def infos
    @infos ||= Info.all
  end
  helper_method :infos

  def info
    @info ||= Info.find(params[:id])
  end
  helper_method :info
end
