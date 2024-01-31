-- return {
--   -- https://github.com/mfussenegger/nvim-dap-python
--   'mfussenegger/nvim-dap-python',
--   ft = 'python',
--   dependencies = {
--     -- https://github.com/mfussenegger/nvim-dap
--     'mfussenegger/nvim-dap',
--   },
--   config = function ()
--     -- -- Update the path passed to setup to point to your system or virtual env python binary
--     -- require('dap-python').setup('/home/sa/.config/nvim/venv/bin/python')
--     require('dap-python').setup('/home/sa/projects/star-burger/venv/bin/python')
--     require('dap')
--     -- Настройка запуска Django
--     local dap = require('dap')
--     dap.adapters.python = {
--       type = 'executable',
--       command = '/home/sa/projects/star-burger/venv/bin/python',
--       args = { '-m', 'debugpy.adapter' }
--     }

--     dap.configurations.python = {
--       {
--         type = 'python',
--         request = 'launch',
--         name = 'Django runserver',
--         program = '/home/sa/projects/star-burger/venv/bin/python',
--         args = {'manage.py', 'runserver'},
--       },
--     }
--       end
-- }
-- Подключение к плагинам
return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  },
  config = function ()
    local dap = require('dap')
    local home_sa_program = '/home/sa/q.py'
    local home_sa_virt_python_comand = '/home/sa/.config/nvim/venv/bin/python'

    local project_sa_program = '/home/sa/projects/proxys-telegram-bot/django/src/manage.py' -- ложим путь до вашего проекта который хотите дебажить,обязательно путь проекта должен находиться в среде(python), туда надо установить обязательно (neovim, isort, debugpy).
    local project_virt_python_comand = '/home/sa/.cache/pypoetry/virtualenvs/proxys-telegram-bot-django-ewhITJVK-py3.11/bin/python'

    dap.adapters.python = {
      type = 'executable',
      -- command = '/home/sa/.cache/pypoetry/virtualenvs/proxys-telegram-bot-django-ewhITJVK-py3.11/bin/python',-- ложим путь до вашего проекта который хотите дебажить,обязательно путь проекта должен находиться в среде(python), туда надо установить обязательно (neovim, isort, debugpy).
      command = home_sa_virt_python_comand,
      args = { '-m', 'debugpy.adapter' }
    }

    dap.configurations.python = {
      {
        justMyCode = false,
        type = 'python',
        request = 'launch',
        name = 'Django runserver',
        -- program = '/home/sa/projects/proxys-telegram-bot/django/src/manage.py', -- путь до программы вашего языука разработки
        program = home_sa_program, -- путь до программы вашего языука разработки
        -- args = {'runserver'},--дополнительная команда к примеру это джанго,
      },
    }
  end
}
