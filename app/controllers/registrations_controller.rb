class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  def create
    raise "BOOM!"
  end
  def update
    super
  end
end