
class Team < ActiveRecord::Base
  #include Pagination  

  # Horrible Oracle stuff here...
  # self.table_name = 'HORRIBLE_ORACLE_TABLE_NAME'
  # self.primary_key = 'nastyprefix_team_id'
  # alias_attribute 'id', 'nastyprefix_team_id'

  # include this mixin to alias all attributes like 'xxx_name' to 'name'
  # i.e. get rid of the table prefix so you can use a sensible attribute
  # name when rendering to json.
  # include AliasLegacyColumns

  # can be overridden by passing a :per_page parameter
  paginates_per 10 

  def self.paginated(params)

    # using kaminari
    Team
      .page(params.fetch(:page) { 1 })
      .per(params.fetch(:per_page) { Team.default_per_page })

  end

end