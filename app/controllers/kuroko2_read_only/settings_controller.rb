module Kuroko2ReadOnly
  class SettingsController < Kuroko2ReadOnly::ApplicationController
    def show
      @users = Kuroko2::User.where.not(id: current_user.id)
    end

    def update
      settings_params.each do |user_id, settings_param|
        user = Kuroko2::User.find(user_id)
        user.update!(read_only: settings_param[:read_only])
      end
      flash[:success] = 'User ReadOnly change complete!!'
      redirect_to settings_path
    end

    private

    def settings_params
      params.permit(users: [:read_only])[:users]
    end
  end
end
