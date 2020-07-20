# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource
  def show
    @user = User.find(params[:id])
    render 'devise/registrations/show'
  end

  def build_resource(hash = nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
