require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- My keymaps
map("i", "kj", "<Esc>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> :Format <cr>") -- Ctrl - S saves and formats
map("i", "<C-H>", "<C-w>") -- Makes ctrl + backspace work

map({ "n", "v" }, "<S-h>", "^")
map({ "n", "v" }, "<S-l>", "$")
map({ "n", "v" }, "<S-j>", "5j")
map({ "n", "v" }, "<S-k>", "5k")

-- With wrap mode enabled, this will treat wrapped line as different line
map("n", "j", "gj")
map("n", "k", "gk")

-- Windown resize
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
--
-- Integrated terminal
map({ "n" }, "<A-y>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })
--
-- CLose tabs
map("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Find selected word using telescope
map(
  "v",
  "<leader>fs",
  [[y:<C-u>lua require'telescope.builtin'.find_files({ default_text = vim.fn.getreg('"') })<cr>]],
  { desc = "find seleced word" }
)

-- show details ( lsp )
map("n", "<leader>k", vim.lsp.buf.hover)

map("n", "<leader>u", vim.cmd.undotreetoggle, { desc = "toggle undo tree" })

map("n", "<leader>e", "<cmd>nvimtreetoggle<cr>", { desc = "nvimtree toggle window" })

map("n", "<a-h>", function() -- switch buffer
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<a-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<leader>gs", vim.cmd.git, { desc = "open git panel" })

-- primeagen keymaps
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])
