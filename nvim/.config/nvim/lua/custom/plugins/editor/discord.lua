return {
  'mistweaverco/discord.nvim',
  event = 'VeryLazy',
  config = function()
    require('discord').setup {
      -- General options
      auto_connect = false, -- Automatically connect to Discord RPC
      logo = 'https://logosrated.net/wp-content/uploads/parser/Neovim-Logo-1.png', -- "auto" or url
      logo_tooltip = nil, -- nil or string
      main_image = 'language', -- "language" or "logo"
      client_id = '1233867420330889286', -- Use your own Discord application client id (not recommended)
      log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
      debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
      blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      file_assets = {}, -- Custom file asset definitions keyed by file names and extensions
      show_time = true, -- Show the timer
      global_timer = true, -- if set false, timer will be reset on aucmds

      -- Rich Presence text options
      editing_text = 'Editing %s', -- Format string rendered when an editable file is loaded in the buffer
      file_explorer_text = 'Browsing %s', -- Format string rendered when browsing a file explorer
      git_commit_text = 'Committing changes', -- Format string rendered when committing changes in git
      plugin_manager_text = 'Managing plugins', -- Format string rendered when managing plugins
      reading_text = 'Reading %s', -- Format string rendered when a read-only or unmodifiable file is loaded
      workspace_text = 'Working on %s', -- Format string rendered when in a git repository
      line_number_text = 'Line %s out of %s', -- Format string rendered when `enable_line_number` is set to true
      terminal_text = 'Using Terminal', -- Format string rendered when in terminal mode
    }
  end,
}
