local function start_day_vote(name, param)
	

	vote.new_vote(name, {
		description = "Make day " .. param,
		help = "/yes,  /no  or  /abstain",
		name = param,
		duration = 60,

		on_result = function(self, result, results)
			if result == "yes" then
				minetest.chat_send_all("Vote passed, " ..
                        #results.yes .. " to " .. #results.no .. ", Time will be set to day ")
                        minetest.set_timeofday(0.5)
				
			else
				minetest.chat_send_all("Vote failed, " ..
						#results.yes .. " to " .. #results.no .. ", "
						)
			end
		end,
    

		on_vote = function(self, name, value)
			minetest.chat_send_all(name .. " voted " .. value .. " to '" ..
					self.description .. "'")
		end
	})
end

minetest.register_chatcommand("vote_day", {
	privs = {
		interact = true
	},
	func = start_day_vote
})