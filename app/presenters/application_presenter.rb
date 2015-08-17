class ApplicationPresenter < SimpleDelegator

  def initialize(model)
    __setobj__(model)
  end

  def eql?(target)
    target == self || user.eql?(target)
  end

  private

  def helpers
    ApplicationController.helpers
  end

end
