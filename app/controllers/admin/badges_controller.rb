class Admin::BadgesController < Admin::BaseController
  before_action :set_admin_badge, only: [:show, :edit, :update, :destroy]

  # GET /admin/badges
  def index
    @badges = Badge.all
  end

  # GET /admin/badges/1
  def show
  end

  # GET /admin/badges/new
  def new
    @badge = Badge.new
  end

  # GET /admin/badges/1/edit
  def edit
  end

  # POST /admin/badges
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success_create')
    else
      render :new
    end
  end

  # PATCH/PUT /admin/badges/1
  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.success_update')
    else
      render :edit
    end
  end

  # DELETE /admin/badges/1
  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success_destroy')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_badge
    @badge = Badge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def badge_params
    params.require(:badge).permit(:title, :image, :rule, :rule_parameter)
  end
end
