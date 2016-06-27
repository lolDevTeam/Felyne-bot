module FelyneBot
	module Commands
		module AddMod
			extend Discordrb::Commands::CommandContainer
			command(
					:addmod,
					description: "Adds mod permissions to Felyne.",
					useage: "addmod <@name> <level> <force>",
					permission_level: 800,
					min_args: 1,
					max_args: 4,
					permission_message: "I'm sorry Dave, I cannot do that.",
			) do |event, uname, level=1, force="no"|
				if level != "delete"
					level = level.to_i
				end
				permarray = []
				permarray = loadArr(permarray,"userbase/perm")
				if $bot.parse_mention(uname) !=nil
					userid = $bot.parse_mention(uname).id
					username = $bot.parse_mention(uname).name
					if permarray.include? userid
						event << "User permissions found... Updating permissions."
						hash = Hash[permarray.map.with_index.to_a]
						i = hash[userid].to_i
						curlevel = permarray[i+1]
						if [800, 999].include? curlevel
							if force == "yes"
								event << "Forcing permission change to lower level."
							end
							if force == "no"
								event << "User permissions level is admin or higher, you must force permissions change to set lower."
							end
							if level == "delete"
								if force == yes
									event << "Force deleting user's permissions"
								else
									event << "You must force deletion of admin or botmaster"
								end
							end
						end

						event << "Current permission level: #{curlevel}"
					else
						event << "User permissions not found... Adding permissions."
					end
				else
					event << "Invalid user."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: addmod"
				nil
			end
		end
	end
end