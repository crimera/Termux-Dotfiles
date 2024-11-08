return {
	"CopilotC-Nvim/CopilotChat.nvim",
	event = "VeryLazy",
	branch = "canary",
	dependencies = {
		{ "github/copilot.vim" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	keys = {
		{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		{
			"<leader>as",
			"<cmd>CopilotChatCommitStage<cr>",
			desc = "Use copilot to generate commit for stagged changes",
		},
		{
			"<leader>ai",
			function()
				local input = vim.fn.input("Quick Chat: ")

				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
				end
			end,
			desc = "CopilotChat Selected",
			mode = "v",
		},
		{
			"<leader>ai",
			function()
				local input = vim.fn.input("Quick Chat: ")

				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end,
			desc = "CopilotChat - Quick chat",
			mode = "n",
		},
	},
	opts = {
		debug = false,
		model = "claude-3.5-sonnet",

		window = {
			layout = "float",
			border = "rounded",
			width = 0.6,
			height = 0.9,
		},
		mappings = {
			close = {
				normal = "<ESC>",
			},
		},
	},
}
