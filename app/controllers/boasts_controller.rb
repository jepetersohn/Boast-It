class BoastsController < ApplicationController
  before_action :find_boast, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  has_scope :category

  def index
    @boasts = Boast.all.order("created_at DESC")
    if user_signed_in?
      @user = current_user.id
    end
  end

  def show
  end

  def new
    @boast = current_user.boasts.build
  end

  def create
    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(boast_params)
    @boast = current_user.boasts.build(unlocked_params)
    if @boast.save
      redirect_to @boast, notice: "Successfully created new Boast"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(boast_params)
    if @boast.update(unlocked_params)
      redirect_to @boast, notice: "Boast was successfuly updated"
    else
      render 'edit'
    end
  end

  def destroy
    @boast.destroy
    redirect_to root_path
  end

  def upvote
    @boast.upvote_by current_user
    redirect_to :back
  end

  def category
    @boasts = apply_scopes(Boast).all.order("created_at DESC")
    render 'category/show'
  end

  private

  def boast_params
    boast_params_hash = params[:boast]
    boast_params_hash[:category_id] = Category.find_or_create_by(name: params[:boast][:category]).id
    boast_params_hash.delete(:category)
    boast_params_hash
  end

  def find_boast
    @boast = Boast.find(params[:id])
  end
end
