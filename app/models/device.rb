require 'net/http'
require 'json'

class Device < ActiveRecord::Base
	belongs_to :sites

	def get_active_power
		uri = URI.parse("http://escamp.ongetit.com/1.1/devices/" + d_id + "/realtimeInfo")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = false
		req = Net::HTTP::Get.new(uri)
		req["Authorization"] = "Basic ZDE4NjMwYmQyZjI5NGY1ZTg1OGU4M2Q3YmNkMjViYzk="
		res = http.request(req)
		parse = JSON.parse(res.body)
		return parse["active_power"]
	end
end
