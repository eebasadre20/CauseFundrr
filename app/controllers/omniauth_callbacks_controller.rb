class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def self.provides_callback_for( provider )
		class_eval %Q{
			def #{provider}
				user = User.from_omniauth(request.env["omniauth.auth"])

				if user.persisted?
					flash.notice = "Signed in!"
					sign_in_and_redirect user
				else
					session["devise.user_attributes"] = user.attributes
					redirect_to new_user_registration_url
				end

			end
		}
	end

	[:twitter, :facebook, :google_oauth2].each do |provider|
		provides_callback_for provider
	end
end
