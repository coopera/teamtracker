class ApplicationPresenter < SimpleDelegator

  attr_accessor :model

  def initialize(model)
    @model = model
    __setobj__(model)
  end

  def eql?(target)
    target == self || model.eql?(target)
  end

  private

  def helpers
    ApplicationController.helpers
  end

end
