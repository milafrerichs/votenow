class UsersController < ApplicationController
  # github callback url
  def register
    sign_in User
      .create_with(name: env['omniauth.auth']['info']['name'], token: env['omniauth.auth']['credentials']['token'])
      .find_or_create_by!(uid: env['omniauth.auth']['uid'])
    redirect_to root_path
  end
  
  def logout
    sign_out
    redirect_to root_path
  end
end
