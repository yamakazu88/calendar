class ConditionsController < ApplicationController
  before_action :condition_set, only: [:show, :destroy, :edit, :update]

  def index
    @data = Condition.where(user_id: current_user).order("start_time DESC").page(params[:page]).per(5)
    @nickname = current_user.nickname
    @user = current_user
  end

  def new
    @data = Condition.new
  end

  def create
    @data = Condition.create(condition_params)
    if @data.save
      @data.temperature += params[:temperature].to_f
      @data.weight += params[:weight].to_f
      redirect_to conditions_path
    else
      render :new
    end
  end

  def show
    @nickname = current_user.nickname
  end

  def edit
    if current_user.id != @data.user_id
      redirect_to conditions_path
    end
  end

  def update
    if @data.update(condition_params)
      redirect_to conditions_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @data.destroy
    redirect_to conditions_path, notice: "削除しました"
  end

  def temp
  end

  def weight
  end

  def blood_max
  end

  def blood_min
  end

  def com
  end

  private

  def condition_params
    params.require(:condition).permit(:start_time, :temperature, :weight, :blood_max, :blood_min, :condition, :memo).merge(user_id: current_user.id)
  end

  def condition_set
    @data = Condition.find(params[:id])
  end
end
