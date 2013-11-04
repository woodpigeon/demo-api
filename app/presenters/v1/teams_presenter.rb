 
 class V1::TeamsPresenter < ResultSetPresenter

  def initialize(teams)
    @teams = teams
  end

  def as_json(options = {})
    {
      _response_info: {
        status: options[:status] || "ok"
      }
    }
    .merge(metadata_for_paginated_array(@teams))
    .merge(present)
  end

  # Just in case an array of teams can be pulled into anoter parent presenter
  # js create the collection hash here.(Hmm, include metadata here?)
  def present

    metadata_for_paginated_array(@teams)
    .merge(results: results)
  end

  private

  # as a convention, it might be useful to always define the 'results' (the
  # collection we are returning) in method as here
  def results
    @teams.map { |team| V1::TeamPresenter.new(team).present }
  end

end