require_relative 'inspect'
require_relative 'rules'

module Cell

  include Inspect
  include Rules  

  def is_dead?
    !self.is_live?
  end

  private

end