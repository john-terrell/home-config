-- Don't stop backspace at insert
vim.opt.backspace = vim.list_extend(vim.opt.backspace:get(), { "nostop" })

-- Keep visual indentation on wrapped lines
vim.opt.breakindent = true;

-- Hide command line unless needed
vim.opt.cmdheight = 0;

-- Hide command line unless needed
vim.opt.cmdheight = 0;

vim.opt.completeopt = 'menu,menuone,noselect'

-- Raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = false;

-- Copy previous indentation on autoindenting
vim.opt.copyindent = true;

-- Highlight current line
vim.opt.cursorline = true;

-- Enable linematch diff algorithm
vim.opt.diffopt = vim.list_extend(vim.opt.diffopt:get(), { "algorithm:histogram", "linematch:60" })

-- Expand <Tab> to spaces
vim.opt.expandtab = true;

-- Disable `~` on nonexistent lines
vim.opt.fillchars = { 
    eob = ' ' 
};

-- Enable fold with all code unfolded
vim.opt.foldcolumn = "1";
vim.opt.foldenable = true;
vim.opt.foldlevel = 99;
vim.opt.foldlevelstart = 99;

-- Ignore case in search patterns
vim.opt.ignorecase = true;

-- Show substitution preview in split window
vim.opt.inccommand = "split";

-- Infer casing on word completion
vim.opt.infercase = true;

-- Global statusline
vim.opt.laststatus = 3;

-- Wrap lines at 'breakat'
vim.opt.linebreak = true;

-- Enable list mode
vim.opt.list = true;

-- Set custom strings for list mode
-- - tabulations are shown as ‒▶
-- - trailing spaces are shown as ·
-- - multiple non-leading consecutive spaces are shown as bullets (·)
-- - non-breakable spaces are shown as ⎕
vim.opt.listchars = "tab:‒▶,trail:·,multispace:·,lead: ,nbsp:⎕";

-- Show line numbers
vim.opt.number = true;

-- Preserve indentation as much as possible
vim.opt.preserveindent = true;

-- Height of the popup menu
vim.opt.pumheight = 10;

-- Display line numbers relative to current line
vim.opt.relativenumber = true

-- Number of spaces to use for indentation
vim.opt.shiftwidth = 4;

-- Disable search count wrap and startup messages
vim.opt.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true })

-- Enable showing modes in command line
vim.opt.showmode = true;

-- Always show tabline
vim.opt.showtabline = 2;

-- Show signs column
vim.opt.signcolumn = "yes";

-- Override ignorecase if search pattern contains uppercase characters
vim.opt.smartcase = true;

-- Number of spaces input on <Tab>
vim.opt.softtabstop = 4;

-- Open horizontal split below (:split)
vim.opt.splitbelow = true;

-- Open vertical split to the right (:vsplit)
vim.opt.splitright = true;

-- Number of spaces to represent a <Tab>
vim.opt.tabstop = 4;

-- Enables 24-bit RGB color
vim.opt.termguicolors = true;

-- Shorter timeout duration
vim.opt.timeoutlen = 500;

-- Set window title to the filename
vim.opt.title = true;

-- Don't save undo history to undo file (in $XDG_STATE_HOME/nvim/undo)
vim.opt.undofile = false;

-- Specify the undo directory location
vim.opt.undodir = os.getenv("HOME") .. ".vim/undodir";

-- Show a colored column at the given column number
vim.opt.colorcolumn = "120";

vim.opt.viewoptions = vim.tbl_filter(function(val) return val ~= "curdir" end, vim.opt.viewoptions:get())

-- Enable virtual edit in visual block mode
-- This has the effect of selecting empty cells beyond lines boundaries
vim.opt.virtualedit = "block";

-- Disable line wrapping
vim.opt.wrap = false;

-- Disable making a backup before overwriting a file
vim.opt.writebackup = false;

