return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		local alpha = require("alpha")
		-- local startify = require("alpha.themes.startify")
		local dashboard = require("alpha.themes.dashboard")

		-- available: devicons, mini, default is mini
		-- if provider not loaded and enabled is true, it will try to use another provider
		dashboard.section.header.val = {
			[[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
			[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
			[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
			[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
			[[██   ████ ███████  ██████    ████   ██ ██      ██]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞   Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "󰩈   Quit NVIM", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		--startify.file_icons.provider = "devicons"
		--require("alpha").setup(
		--startify.config
		--)
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
