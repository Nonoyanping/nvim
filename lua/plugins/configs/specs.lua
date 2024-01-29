local Specs = {}

Specs.opts = {
    show_jumps = true,
    min_jump = 15,
    popup = {
        delay_ms = 5, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = "PMenu",
        fader = require("specs").pulse_fader,
        -- fader = function(blend, cnt)
        --     if cnt > 100 then
        --         return 80
        --     else return nil end
        -- end,
        resizer = require("specs").shrink_resizer,
        -- resizer = function(width, ccol, cnt)
        --     if width-cnt > 0 then
        --         return {width+cnt, ccol}
        --     else return nil end
        -- end,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

--[[ You can implement your own custom fader/resizer functions for some pretty cool effects:
require('specs').setup{
	popup = {
		-- Simple constant blend effect
		fader = function(blend, cnt)
			if cnt > 100 then
				return 80
			else return nil end
		end,
		-- Growing effect from left to right
		resizer = function(width, ccol, cnt)
			if width-cnt > 0 then
				return {width+cnt, ccol}
			else return nil end
		end,
	}
}
--]]

-- ##############################
-- ######### [[Faders]] #########
-- ##############################
-- sinus_fader ⌣/⌢\⌣/⌢\⌣/⌢\⌣/⌢

-- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██

-- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇

-- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁

-- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

-- ##############################
-- ####### [[Resizers:]] #######
-- ##############################

-- shrink_resizer ░░▒▒▓█████▓▒▒░░

-- slide_resizer ████▓▓▓▒▒▒▒░░░░

-- empty_resizer ███████████████

return Specs
