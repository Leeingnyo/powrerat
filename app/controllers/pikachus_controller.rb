class PikachusController < ApplicationController
	def realtime_info
		render json: Pikachu.info(Pikachu.last.id)
	end

	def info
		render json: Pikachu.info((Pikachu.last params[:num]).first.id)
	end
end
