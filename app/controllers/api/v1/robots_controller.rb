class Api::V1::RobotsController < InheritedResources::Base
  def index
    robots = Robot.all
    respond_to do |format|
      format.json { render json: robots }
    end
  end

  def show
    robot = Robot.find(params[:id])
    respond_to do |format| 
      format.json { render json: robot }
    end
  end

  def create
    robot = Robot.new(robot_params)
    if robot.save
      robot.update_attributes({user_id: current_user.id})
    else
      robot = {error: robot.errors}
    end
    respond_to do |format| 
      format.json { render json: robot }
    end
  end

  def update
    robot = Robot.find(params[:id])
    if robot.user_id == current_user.id
      robot.update(robot_params)
    else
      robot = {error: 'not your robot'}
    end
    respond_to do |format|
      format.json { render json: robot}
    end
  end

  private

    def robot_params
      params.require(:robot).permit(:name, :age, :robot_type)
    end
end

