class V1::TeamPresenter

  def initialize(team)
    @team = team
  end

  def as_json(options = {})
    {
      _response_info: {
        status: options[:status] || "ok"
      }
    }.merge(present)
  end

  # Presenters for singular resources are used to render that resource insside 
  # collection presenters via their present method, 
  # in which case the as_json is never called on this presenter. 
  # However when rendering a single resource to json using this presenter
  # the as_json is called when we to a 'respond_with @presenter' in our controller. 
  # Thus the _response_info is only rendered in this latter scenario. I made that sound 
  # very complicated.
  def present
    {
      id: @team.id,
      name: @team.name,
      email: @team.email
    }
  end

end