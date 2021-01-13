class MedicinesController < ApplicationController
  before_action :medicine_set, only: [:show, :destroy, :edit, :update]

  def index
    @nickname = current_user.nickname
    @user = current_user
    if params[:tag]
      @medicines = Medicine.tagged_with("#{params[:tag]}").where(user_id: current_user).order("start_time DESC").page(params[:page]).per(3)
    else
      @medicines = Medicine.where(user_id: current_user).order("start_time DESC").page(params[:page]).per(3)
    end
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.create(medicine_params)
    if @medicine.save
      redirect_to medicines_path
    else
      render :new
    end
  end

  def show
    @nickname = current_user.nickname
  end

  def destroy
    @medicine.destroy
    redirect_to medicines_path, notice:"削除しました"
  end

  def edit
    if current_user.id != @medicine.user_id
      redirect_to medicines_path
    end
  end

  def update
    if @medicine.update(medicine_params)
      redirect_to medicines_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :start_time, :memo, :image, :tag_list).merge(user_id: current_user.id)
  end

  def medicine_set
    @medicine = Medicine.find(params[:id])
  end
end