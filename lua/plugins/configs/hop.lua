local Hop = {}
Hop.opts = {
  -- keys = 'etovxqpdygfblzhckisuran', -- default config
  keys = 'efovxqpdygtblzhckisuran',
  quit_key = '<C-c>',
  jump_on_sole_occurrence = true,
  case_insensitive = true,

  -- prevent Hop from automatically inserting the autocommands for highlighting
  create_hl_autocmd = true,
  -- current_line_only = true,
  -- multi_windows = true,
}

-- [[ Hop Keymappings ]]
function Hop.hop_in_line(directions, offset_num)
  local direc = function()
    if directions == "forward" then
      return require('hop.hint').HintDirection.AFTER_CURSOR
    elseif directions == "backward" then
      return require('hop.hint').HintDirection.BEFORE_CURSOR
    end
  end
  require("hop").hint_char1({ direction = direc, current_line_only = true, hint_offset = offset_num})
end

function Hop.hop_word_in_line()
  require("hop").hint_words({ current_line_only = true })
end


--[[
function Hop.hop_in_node()
  require'hop-treesitter'.hint_nodes()
end
]]

-- HopNodes      -> Goto treesitter nodes (:HopNodes)

-- [[Global Hopping]]
-- map("n", "HH", ":HopWord<cr>")
-- map("n", "HF", ":HopPattern<cr>")
-- map("n", "HL", ":HopLineStart<cr>")
-- map("n", "<Leader><Leader>w", "<cmd>HopWord<cr>", opts)
-- map("n", "<Leader><Leader>l", "<cmd>HopLine<cr>", opts)
-- map("n", "<Leader><Leader>f", "<cmd>HopChar1<cr>", opts)
-- map("n", "H", ":HopChar2<cr>", opts)
--
-- map("n", "/", ":HopPattern<cr>", opts)
-- map("n", "L", ":HopWordCurrentLine<cr>", opts)


return Hop

-- HopAnywhere	 -> require'hop'.hint_anywhere()
-- HopChar1	     -> require'hop'.hint_char1()
-- HopChar2	     -> require'hop'.hint_char2()
-- HopLine	     -> require'hop'.hint_lines()
-- HopLineStart	 -> require'hop'.hint_lines_skip_whitespace()
-- HopVertical	 -> require'hop'.hint_vertical()
-- HopPattern	   -> require'hop'.hint_patterns()
-- HopWord	     -> require'hop'.hint_words()
-- HopNodes      -> Goto treesitter nodes (:HopNodes)

-- [[ Available Commands ]]
-- HopAnywhere   -> HopAnywhere*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopCamelCase  -> HopCamelCase*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopChar1      -> HopChar1*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopChar2      -> HopChar2*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopLine       -> HopLine*(AC, BC, MW, Start, StartAC, StartBC, StartMW)
-- HopNodes      -> HopNodes
-- HopPattern    -> HopPattern*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopVertical   -> HopVertical*(AC, BC, MW)
-- HopWord       -> HopWord*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopPasteChar1 -> HopPasteChar1*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)
-- HopYankChar1  -> HopYankChar1*(AC, BC, CurrentLine, CurrentLineAC, CurrentLineBC, MW)

