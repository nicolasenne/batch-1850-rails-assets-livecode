class CompletionsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @completion = Completion.new
  end

  # One completion per form:
  # def create
  #   @plant = Plant.find(params[:plant_id])
  #   @completion = Completion.new(completion_params)
  #   @completion.plant = @plant
  #   @completion.save
  #   redirect_to garden_path(@plant.garden)
  # end

  # Multiple completions per form:
  def create
    @plant = Plant.find(params[:plant_id])
    @chores = Chore.where(id: params[:completion][:chore_id])
    @chores.each do |chore|
      completion = Completion.new(plant: @plant, chore: chore)
      completion.save
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def completion_params
    params.require(:completion).permit(:chore_id)
  end
end
