-- return{
--   "Exafunction/codeium.vim",
--   lazy = false,
--   config = function()
--     vim.g.codeium_no_map_tab = 1
--     vim.keymap.set("i", "<C-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
--   end
-- }



return {
  "Exafunction/codeium.vim",
  lazy = false, -- Загружать сразу при старте
  init = function() -- Настройки, выполняемые ДО загрузки плагина
    vim.g.codeium_no_map_tab = 1 -- Отключаем стандартный маппинг Tab
    vim.g.codeium_disable_bindings = 1 -- Полный контроль над маппингами
  end,
  config = function() -- Настройки после загрузки
    -- Основные маппинги
    vim.keymap.set("i", "<C-l>", function() 
      return vim.fn["codeium#Accept"]() 
    end, { expr = true, desc = "Accept Codeium suggestion" })

    -- Дополнительные маппинги для всех буферов
    vim.keymap.set("i", "<C-f>", function()
      vim.fn["codeium#Complete"]()
    end, { desc = "Force Codeium completion" })

    -- Автокоманды для специфичных файлов
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        -- Специфичные для Python маппинги
        vim.keymap.set("i", "<C-b>", function()
          vim.fn["codeium#CycleCompletions"](1) -- Следующее предложение
        end, { buffer = true, desc = "Next Codeium suggestion" })

        vim.keymap.set("i", "<C-S-b>", function()
          vim.fn["codeium#CycleCompletions"](-1) -- Предыдущее предложение
        end, { buffer = true, desc = "Prev Codeium suggestion" })
      end
    })
  end
}
