class SitesController < ApplicationController
	def index
	end

	def usage_all
		timestamp = params[:timestamp]
		if timestamp == nil
			render json: {res: "timestamp is missing"}
		else
			render json: Site.usage_all(timestamp.to_i)
		end
	end

	def active_all
		render json: Site.active_all
	end
end
