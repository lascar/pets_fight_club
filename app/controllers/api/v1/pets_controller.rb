class Api::V1::PetsController < InheritedResources::Base
  def index
    pets = Pet.all
    respond_to do |format|
      format.json { render json: pets }
    end
  end

  def show
    pet = Pet.find(params[:id])
    respond_to do |format| 
      format.json { render json: pet }
    end
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      pet.update_attributes({user_id: current_user.id})
    else
      pet = {error: pet.errors}
    end
    respond_to do |format| 
      format.json { render json: pet }
    end
  end

  def update
    pet = Pet.find(params[:id])
    if pet.user_id == current_user.id
      pet.update(pet_params)
    else
      pet = {error: 'not your pet'}
    end
    respond_to do |format|
      format.json { render json: pet}
    end
  end

  private

    def pet_params
      params.require(:pet).permit(:name, :age, :pet_type)
    end
end

