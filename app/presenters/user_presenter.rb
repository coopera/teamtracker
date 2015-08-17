class UserPresenter < ApplicationPresenter

  attr_accessor :user

  def initialize(user)
    @user = user
    super(user)
  end

  def avatar
    helpers.image_tag(user.avatar_url, class: 'avatar') unless user.avatar_url.empty?
  end

end
