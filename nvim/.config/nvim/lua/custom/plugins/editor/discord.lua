return {
  'andweeb/presence.nvim',
  opts = {
    auto_update = true, -- Update activity based on autocmd events
    neovim_image_text = 'The One True Text Editor', -- Text displayed when hovered over the Neovim image
    main_image = 'neovim', -- Main image display (either "neovim" or "file")
    client_id = '793271441293967371', -- Use your own Discord application client id (not recommended)
    log_level = nil, -- Log messages at or above this level ("debug", "info", "warn", "error")
    debounce_timeout = 10, -- Number of seconds to debounce events
    enable_line_number = false, -- Displays the current line number instead of the current project
    blacklist = {}, -- List of strings or Lua patterns that disable Rich Presence for matching files
    buttons = true, -- Configure Rich Presence button(s)
    file_assets = {}, -- Custom file asset definitions keyed by file names and extensions
    show_time = true, -- Show the timer

    -- Rich Presence text options
    editing_text = 'Editing %s',
    file_explorer_text = 'Browsing %s',
    git_commit_text = 'Committing changes',
    plugin_manager_text = 'Managing plugins',
    reading_text = 'Reading %s',
    workspace_text = 'Working on %s',
    line_number_text = 'Line %s out of %s',
  },
}
