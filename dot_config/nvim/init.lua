require('vim._core.ui2').enable({
  enable = true,
  msg = {
    target = 'cmd',
    msg = {
      height = 0.5,
      timeout = 4500,
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    pager = {
      height = 0.5,
    },
  },
})

vim.o.autocomplete = true
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.complete = '.,w,b,t,u,o'
vim.o.completeopt = 'fuzzy,menuone,popup,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.pumborder = 'rounded'
vim.o.relativenumber = true
vim.o.scrolloff = 3
--vim.o.scrolloffpad = 3
vim.o.shiftwidth = 2
vim.o.showbreak = '⋯ '
vim.o.signcolumn = 'yes'
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitright = true
vim.o.syntax = 'on'
vim.o.tabstop = 2
vim.o.winborder = 'rounded'

vim.g.mapleader = ' '

require('mknejp')
