class ConditionsController < ApplicationController
  def index
    @data = Condition.where(user_id: current_user).order("start_time DESC").page(params[:page]).per(5)
    @nickname = current_user.nickname
  end

  def new
    @data = Condition.new
  end

  def create
    @data = Condition.create(condition_params)
    if @data.save
      redirect_to conditions_path
    else
      render :new
    end
  end

  def show
    @data = Condition.find(params[:id])
    @nickname = current_user.nickname
  end

  def edit
    @data = Condition.find(params[:id])
    if current_user.id != @data.user_id
      redirect_to conditions_path
    end
  end

  def update
    @data = Condition.find(params[:id])
    if @data.update(condition_params)
      redirect_to conditions_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @data = Condition.find(params[:id])
    @data.destroy
    redirect_to conditions_path, notice: "削除しました"
  end

  private

  def condition_params
    params.require(:condition).permit(:start_time, :temperature, :weight, :blood_max, :blood_min, :condition, :memo).merge(user_id: current_user.id)
  end
end
