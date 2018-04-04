class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show;
    if @test_passage.questions_count == 0
      flash[:notice] = 'This test has no questions yet.'
      redirect_to tests_path
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
