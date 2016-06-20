module FelyneBot
	module Commands
		module RolePlay
			extend Discordrb::Commands::CommandContainer
			command(
					:rp,
					description: "Nothing to see here.",
					useage: "rp <text>",
					permission_level: 1,
					permission_message: "I'm sorry Dave, I cannot do that."
			) do |event, *phrase|
				roleplaytext = phrase.join(' ')
				event << "sent **#{roleplaytext}** to mhodiscussion"
				$bot.send_message(122526505606709257, roleplaytext)
				puts '#{event.timestamp}: #{event.user.name}: CMD: roleplay'
				nil
			end
		end
	end
end