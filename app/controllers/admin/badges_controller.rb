class Admin::BadgesController < Admin::BaseController
  before_action :set_admin_badge, only: [:show, :edit, :update, :destroy]

  # GET /admin/badges
  # GET /admin/badges.json
  def index
    @badges = Badge.all
  end

  # GET /admin/badges/1
  # GET /admin/badges/1.json
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
  # POST /admin/badges.json
  def create
    @badge = Badge.new(admin_badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @admin_badge, notice: 'Badge was successfully created.' }
        format.json { render :show, status: :created, location: @admin_badge }
      else
        format.html { render :new }
        format.json { render json: @admin_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/badges/1
  # PATCH/PUT /admin/badges/1.json
  def update
    respond_to do |format|
      if @admin_badge.update(admin_badge_params)
        format.html { redirect_to @admin_badge, notice: 'Badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_badge }
      else
        format.html { render :edit }
        format.json { render json: @admin_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/badges/1
  # DELETE /admin/badges/1.json
  def destroy
    @admin_badge.destroy
    respond_to do |format|
      format.html { redirect_to admin_badges_url, notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_badge
      @badge = Badge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_badge_params
      params.fetch(:badge, {})
    end
end
