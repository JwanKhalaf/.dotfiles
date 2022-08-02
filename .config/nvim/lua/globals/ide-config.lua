-- set the leader key
global.mapleader = " "

-- block cursor (instead of a thin line)
options.guicursor = ""

-- always show the 'sign column' which is the column to the very left
options.signcolumn = "yes"

-- line numbers
options.nu = true

-- relative line numbers
options.relativenumber = true

-- tab with
options.tabstop = 4

-- soft tab stop width
options.softtabstop = 4

-- number of spaces used for each step of autoindent
options.shiftwidth = 2

-- convert tabs to spaces
options.expandtab = true

-- autoindent when starting a new line
options.smartindent = true

-- turn off text wrap
options.wrap = false

-- having long update time (default is 5000ms or 4 seconds) leads to noticeable
-- delays and a poor user experience, hence this change
options.updatetime = 50

-- show pattern match as it is being typed
options.incsearch = true

-- minimum number of lines to keep above and below the cursor when scrolling
options.scrolloff = 10

-- automatically save undo history to an undo file
options.undofile = true

-- remove mode text from the very bottom as lightline plugin is clear already
options.showmode = false

-- vertical bar for line length
options.colorcolumn = "80"

-- make "+y copy to system clipboard
options.clipboard = unnamedplus
