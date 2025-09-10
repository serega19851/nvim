-- Set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk
keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w!<CR>") -- save

 -- open URL under cursor
keymap.set("n", "<leader>gx", ":!xdg-open <c-r><c-a><CR>")

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sg", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window

keymap.set("n", "<leader>sk", "<C-w>-5") -- make split window height shorter
keymap.set("n", "<leader>sj", "<C-w>+5") -- make split windows height taller
keymap.set("n", "<leader>sh", "<C-w>>5") -- make split windows width bigger
keymap.set("n", "<leader>sl", "<C-w><5") -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew <C-r>=input('Filename: ')<CR><CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c") -- next diff hunk
keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
keymap.set("n", "<leader>ff", function()require("telescope.builtin").find_files({ hidden = true })end, {})
keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({ hidden = true })
end, { desc = "Live grep (including hidden)" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, {})
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, {})
keymap.set("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- buffers
keymap.set("n", "<leader>n", ":bn<cr>")
keymap.set("n", "<leader>p", ":bp<cr>")
keymap.set("n", "<leader>x", ":bd<cr>")
keymap.set('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
keymap.set('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
keymap.set('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
keymap.set('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
keymap.set('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
keymap.set('n', '<Leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
keymap.set('n', '<Leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
keymap.set('n', '<Leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
keymap.set('n', '<Leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
keymap.set('n', '<Leader>bc', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })


-- Terminal
keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=100<CR>")

--nohlsearch
keymap.set("n", "<leader>,", ":nohlsearch<cr>")

-- markdown preview
keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<cr>")

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap.set("i", "<C-Space>", function()
  require('cmp').complete()
end, { desc = "Trigger completion menu" })


-- оборорачивает в парные символы когда слово выделено.
keymap.set("v", "<leader>z'", "c'<C-r>\"'<Esc>", { noremap = true, silent = true })
keymap.set("v", '<leader>z"', 'c"<C-r>""<Esc>', { noremap = true, silent = true })
keymap.set("v", "<leader>z(", "c(<C-r>\")<Esc>", { noremap = true, silent = true })
keymap.set("v", "<leader>z[", "c[<C-r>\"]<Esc>", { noremap = true, silent = true })
keymap.set("v", "<leader>z{", "c{<C-r>\"}<Esc>", { noremap = true, silent = true })


-- ruff
-- Форматирование как black + сортировка импортов
keymap.set('n', '<leader>rf', function()
    local filename = vim.fn.expand('%')
    -- Сначала сортировка импортов
    os.execute('ruff check --select=I --fix ' .. filename)
    -- Затем форматирование
    os.execute('ruff format ' .. filename)
    -- Обновляем буфер
    vim.cmd('edit!')
    print("✓ Ruff: formatted and sorted imports")
end)

-- Только форматирование (как black)
keymap.set('n', '<leader>bf', ':!ruff format %<CR> :edit!<CR>', { silent = true })
-- Только сортировка импортов
keymap.set('n', '<leader>si', ':!ruff check --select=I --fix %<CR> :edit!<CR>', { silent = true })

-- nvim-dap.lua
-- python -Xfrozen_modules=off -m debugpy --listen 0.0.0.0:5678 -m uvicorn main:app  так запускается фаст апи через дебаг пай и примерно такой же принцип и в джанго 
