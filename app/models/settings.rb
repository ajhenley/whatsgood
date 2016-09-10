# RailsSettings Model
class Settings < RailsSettings::CachedSettings
  defaults[:splashTitle] = 'This is my title'
  defaults[:splashSubtitle] = 'This is my subtitle'
  defaults[:facebook] = 'whatsgood'
  defaults[:twitter] = 'whatsgood'
  defaults[:instagram] = 'whatsgood'
  defaults[:pinterest] = 'whatsgood'

end
