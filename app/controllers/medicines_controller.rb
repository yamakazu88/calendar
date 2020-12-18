class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.where(user_id: current_user).order("start_time DESC").page(params[:page]).per(3)
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
    @medicine = Medicine.find(params[:id])
  end

  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
    redirect_to medicines_path, notice:"削除しました"
  end

  def edit
    @medicine = Medicine.find(params[:id])
    if current_user.id != @medicine.user_id
      redirect_to medicines_path
    end
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update(medicine_params)
      redirect_to medicines_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :start_time, :memo).merge(user_id: current_user.id)
  end
end