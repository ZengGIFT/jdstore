class TestsController < ApplicationController
  def create
    @test = Test.new
  end

  private
  def test_params
    params.require(:title)
  end
end
