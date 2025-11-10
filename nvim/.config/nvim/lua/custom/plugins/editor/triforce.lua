return {
  'gisketch/triforce.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvzone/volt' },
  config = function()
    require('triforce').setup {
      enabled = true,
      gamification_enabled = true,

      notifications = {
        enabled = true,
        level_up = true,
        achievements = true,
      },

      keymap = {
        show_profile = '<leader>lp',
      },

      auto_save_interval = 300,

      custom_languages = {
        gleam = { icon = '✨', name = 'Gleam' },
        odin = { icon = '🔷', name = 'Odin' },
      },

      level_progression = {
        tier_1 = { min_level = 1, max_level = 10, xp_per_level = 300 },
        tier_2 = { min_level = 11, max_level = 20, xp_per_level = 500 },
        tier_3 = { min_level = 21, max_level = math.huge, xp_per_level = 1000 },
      },

      xp_rewards = {
        char = 1,
        line = 1,
        save = 50,
      },
    }
  end,
}
