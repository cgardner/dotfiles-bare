local M = {}

M.setup = function()
  print('loaded coq ')
  vim.cmd[[let g:coq_settings = { 'auto_start': v:true }]]
end

return M
