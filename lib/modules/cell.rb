require_relative 'inspect'
require_relative 'rules'

module Cell

  include Inspect
  include Rules  

  def dead?
    !self.live?
  end

  private

end