class V1::TeamsController < ApiController

  def show
    @team = Team.find(params[:id])
    respond_with V1::TeamPresenter.new(@team).present
  end

  def index
    @teams = Team.paginated(params)
    respond_with V1::TeamsPresenter.new(@teams).present
  end

  def update
    @team = Team.find(params[:id])
    
    # TODO: raise 404 if not found
    # TODO: rase 4xx is id != params['need']['id']

    @team.assign_attributes(filtered_params.permit([:name, :email]))
    
    if @team.valid?
      @team.save!
      render nothing: true, status: 204
    else
      error 422, message: :invalid_attributes, errors: @team.errors.full_messages
    end
  end
  

private 

  def filtered_params
    params.except(:id, :action, :controller, :author)
  end

  def team_params
    pry
    params.require(:team).permit([:name, :email])
  end
  
end
