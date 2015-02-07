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

	def self.active_appliances_all
		active_appliances = Array.new
		all.each do |x|
			#next if x.id != 1
			active_appliances << x.active_appliances
		end
		return active_appliances
	end

	def active_appliances
		uri = URI.parse("http://escamp.ongetit.com/1.1/sites/" + s_id + "/realtime/info/appliances")
		http = Net::HTTP.new(uri.host, uri.port)
		req = Net::HTTP::Get.new(uri)
		req["Authorization"] = "Basic ZDE4NjMwYmQyZjI5NGY1ZTg1OGU4M2Q3YmNkMjViYzk="
		res = http.request(req)
		parse = JSON.parse(res.body)
		parse.keys
		active_appliance = Array.new
		parse.keys.each do |key|
			uri = URI.parse("http://escamp.ongetit.com/1.1/appliances/" + key.to_s)
			http = Net::HTTP.new(uri.host, uri.port)
			req = Net::HTTP::Get.new(uri)
			req["Authorization"] = "Basic ZDE4NjMwYmQyZjI5NGY1ZTg1OGU4M2Q3YmNkMjViYzk="
			res = http.request(req)
			parse_ = JSON.parse(res.body)
			ar = Array.new
			parse[key].each do |par|
				ar << par["active_power"]
			end
			active_appliance << {key: key, active_power: ar, name: name + ":" + parse_["name"].to_s}
		end
		return active_appliance
	end
end
