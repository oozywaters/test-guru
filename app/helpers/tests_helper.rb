module TestsHelper
  def test_result
    if @test_passage.passed?
      "<h1 style='color: green'>Your success rate: #{@test_passage.success_rate}%. Test passed!</h2>".html_safe
    else
      "<h1 style='color: red'>Your success rate: #{@test_passage.success_rate}%. Test failed!</h2>".html_safe
    end
  end
end
