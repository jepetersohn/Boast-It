class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  has_scope :by_category

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(pin_params)
    @pin = current_user.pins.build(unlocked_params)
    if @pin.save
      redirect_to @pin, notice: "Successfully created new Pin"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was successfuly updated"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  def category
    @pins = apply_scopes(Pin).all.order("created_at DESC")
    render 'category/show'
  end

  private

  def pin_params
    pin_params_hash = params[:pin]
    pin_params_hash[:category_id] = Category.find_or_create_by(name: params[:pin][:category]).id
    pin_params_hash.delete(:category)
    pin_params_hash
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
