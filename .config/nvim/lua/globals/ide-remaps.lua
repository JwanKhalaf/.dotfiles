-- n.nore.map splits into three bits
-- n = normal, and that is the mode of nvim is currently in
-- nore = no recursive execution
-- map = literally the command map since we are mapping one things to another
local nnoremap = require("globals.ide-keymaps").nnoremap
local inoremap = require("globals.ide-keymaps").inoremap

-- remap to open netrw
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- remap to exit insert mode
inoremap("jj", "<ESC>")

-- remap for system copy
nnoremap("<leader>y", "\"+y")
