local colors = {
  black        = '#0d0c13',
  white        = '#5e4c6f',
  white2       = '#6c4c97',
  red          = '#ff041f',
  green        = '#00de4e',
  blue         = '#0d46ff',
  yellow       = '#ffd729',
  gray         = '#403b62',
  darkgray     = '#26233a',
  lightgray    = '#312d4b',
  inactivegray = '#7c6f64',
}

local heya = {
  normal = {
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  command = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white2},
    c = {bg = colors.darkgray, fg = colors.white}
  }
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = heya
            }
        })
    end
}




