class DosesController < ApplicationController


  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(Ingredient.find_by_name(params[:dose][:ingredient]).id)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:description)
  end

end
