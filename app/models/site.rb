require 'net/http'
require 'json'

class Site < ActiveRecord::Base
	has_many :devices

	def self.usage_all(timestamp)
		usage_all = Array.new
		all.each do |x|
			usage_all << Hash["name", x.name, "usage", x.usage(timestamp)]
		end
		return usage_all
	end

	def usage(timestamp)
		uri = URI.parse("http://escamp.ongetit.com/1.1/sites/" + s_id + "/meteringUsage?timestamp=" + timestamp.to_s)
		http = Net::HTTP.new(uri.host, uri.port)
		req = Net::HTTP::Get.new(uri)
		req["Authorization"] = "Basic ZDE4NjMwYmQyZjI5NGY1ZTg1OGU4M2Q3YmNkMjViYzk="
		res = http.request(req)
		parse = JSON.parse(res.body)
		return parse["meteringPeriodUsage"]
	end
	
	def self.active_all
		active_all = Array.new
		all.each do |x|
			active_all << Hash["name", x.name, "active_power", x.active_power()]
		end
		return active_all
	end

	def active_power
		i = 0
		devices.each do |x|
			i += x.get_active_power()
		end
		return i
	end
end
