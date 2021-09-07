local utils = require'utils'

-- Disable continuation of comments on next line
utils.define_augroups({
    _general_settings = {
        {'BufWinEnter', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\', \'r\'})'},
        {'BufRead', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\', \'r\'})'},
        {'BufNewFile', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'o\', \'r\'})'},
    }
})
