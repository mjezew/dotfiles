if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep --hidden -g !.git"
end
