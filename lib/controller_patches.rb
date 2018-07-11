# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do
    HelpController.class_eval do
        def terms_of_use
        end

        def privacy_policy
        end
    end

    UserController.class_eval do
      private

      def user_params
          params.require(:user_signup).permit(:name, :email, :password, :password_confirmation, :status_flag, :address_line,:terms)
      end


      #def user_params(key = :user)
      #    params[key].permit(:name,:email,:password,:address_line,:status_flag,:password_confirmation,:terms)
      #end

    end

end
