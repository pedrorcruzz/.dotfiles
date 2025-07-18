return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',

      -- Adapters:
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-python',
      'V13Axel/neotest-pest',
      'rcasia/neotest-java',
      'marilari88/neotest-vitest',
    },
    keys = {
      { '<leader>nr', '<cmd>Neotest run <cr>', desc = 'NeoTest: Run' },
      {
        '<leader>nR',
        function()
          require('neotest').run.run(vim.fn.getcwd() .. '/tests')
        end,
        desc = 'NeoTest: Run All Tests',
      },
      { '<leader>nl', '<cmd>Neotest run last <cr>', desc = 'NeoTest: Run Last' },
      { '<leader>ns', '<cmd>Neotest stop<cr>', desc = 'NeoTest: Stop' },
      { '<leader>nj', '<cmd>Neotest jump<cr>', desc = 'NeoTest: Jump' },
      { '<leader>na', '<cmd>Neotest attach<cr>', desc = 'NeoTest: Attach' },
      { '<leader>no', '<cmd>Neotest output<cr>', desc = 'NeoTest: Output' },
      { '<leader>nn', '<cmd>Neotest output-panel<cr>', desc = 'NeoTest: Output Panel' },
      { '<leader>nt', '<cmd>Neotest summary<cr>', desc = 'NeoTest: Summary' },

      --Languages
      --Go
      { '<leader>nga', '<cmd>GoAddTest<cr>', desc = 'Go Add Test' },
      { '<leader>ngA', '<cmd>GoAddAllTest<cr>', desc = 'Go Add All Test' },
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      require('neotest').setup {
        settings = {
          watch = true,
        },
        adapters = {
          require 'neotest-go' {},
          require 'neotest-jest' {
            jestCommand = 'npx jest',
            jestConfigFile = 'jest.config.ts',
          },
          require 'neotest-python' {
            dap = { justMyCode = false },
            args = { '--log-level', 'DEBUG' },
            runner = 'pytest',
            python = '.venv/bin/python',
            pytest_discover_instances = true,
          },
          require 'neotest-pest' {
            ignore_dirs = { 'vendor', 'node_modules' },
            root_ignore_files = { 'phpunit-only.tests' },
            test_file_suffixes = { 'Test.php', '_test.php', 'PestTest.php' },
            sail_enabled = function()
              return false
            end,
            sail_executable = 'vendor/bin/sail',
            sail_project_path = '/var/www/html',
            pest_cmd = 'vendor/bin/pest',
            parallel = 16,
            compact = false,
            results_path = function()
              return '/tmp/neotest-pest-results.xml'
            end,
          },
          require 'neotest-java' {},
          require 'neotest-vitest' {},
        },
      }
    end,
  },

  {
    'rcasia/neotest-java',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
  },
}
