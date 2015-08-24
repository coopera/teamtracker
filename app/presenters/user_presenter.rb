class UserPresenter < ApplicationPresenter

  def avatar
    helpers.image_tag(model.avatar_url, class: 'avatar') unless (model.avatar_url.empty? || model.avatar_url.nil?)
  end

end
