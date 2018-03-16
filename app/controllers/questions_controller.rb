class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show]

  def new
    @question = @test.questions.build
  end

  def show
    render json: @question
  end

  def create
    @question = @test.questions.build(question_params)
    @question.answers << Answer.new(text: 'Yes', question: @question)

    if @question.save!
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
