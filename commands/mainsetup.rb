module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				$targettime = targettime.to_i
				#write to file
				File.write('bot/maint', $targettime)
				event << "#{h} hours #{m} minutes left until the end of maintenance"
			end
		end
	end
end