class ApplicationController < ActionController::Base
  
	protect_from_forgery
  	include SessionsHelper
  	include PromotionsHelper

  	before_filter :set_locale

  	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def search
		@products = Product.where("name LIKE ?", "%#{params[:name]}%").paginate(page: params[:page])
		render "products/show"
	end

end
