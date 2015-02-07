class SitesController < ApplicationController
	def usage_all
		timestamp = params[:timestamp]
		if timestamp == nil
			render json: {res: "timestamp is missing"}
		else
			render json: Site.usage_all(timestamp.to_i)
		end
	end
end
