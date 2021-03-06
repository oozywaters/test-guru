class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests_created.build(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: 'Test created successfully'
    else
      render :new
    end
  end

  def update
    @test = Test.find(params[:id])

    if @test.save
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :timer, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found', status: 404
  end
end
