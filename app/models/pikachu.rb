class Pikachu < ActiveRecord::Base
	def self.damaging
		pikachu = Pikachu.last
		while true
			if pikachu == nil
				pikachu = Pikachu.create max_power: 5000, survival: 0, remaining_power: 5000
			end
			pikachu.be_damaged
			sleep 2
			if pikachu.remaining_power < 0
				pikachu.cause_of_death = Site.usage_all (Time.now.to_i.to_s + "000").to_i
				pikachu.cause_of_death_2 = Site.active_appliances_all
				pikachu = nil
			end
		end
	end

	def be_damaged
		d = 0
		Site.all.each do |x|
			d += x.active_power
		end
		puts d / 100000
		self.remaining_power -= d / 100000
		self.save
	end

	def self.info(id)
		a = find id
		return {survival: a.survival, remaining_power: a.remaining_power \
			, max_power: a.max_power, cause_of_deaths: [a.cause_of_death, a.cause_of_death_2]}
	end
end
