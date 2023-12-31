local options = {
	-- 種々ファイルの出力
	backup = false,
	swapfile = false,
	undofile = false,

	-- 入力
	backspace = { "indent", "eol", "start" },

	-- 表示
	---- 番号表示
	number = true,
	---- 80 桁目の目印
	colorcolumn = { 80 },
	---- 相対番号表示
	relativenumber = true,
	---- ルーラー
	ruler = false,
	---- 特殊文字表示
	list = true,
	listchars = { eol = "¬", tab = "› ", trail = "˽", extends = "»", precedes = "«", nbsp = "·" },
	fillchars = { fold = "‣", eob = "◦" },
	---- ビジュアルベル
	-- visualbell = true,
	---- モード表示
	showmode = false,
	---- カーソルがある行の協調表示
	cursorline = true,
	cursorlineopt = { "number" },
	---- 目印カラム表示
	signcolumn = "yes", -- 常に表示
	---- カッコの連携
	showmatch = true,
	matchtime = 1, -- 0.1 秒の何倍かを設定
	---- 行の折り返し
	wrap = true,
	whichwrap = "b,s,h,l,[,],<,>,~",
	display = "lastline", -- できる限り表示
	breakindent = true, -- 行を折り返すときにインデントを考慮する
	---- 画面分割
	splitbelow = true,
	splitright = true,
	equalalways = true, -- 画面分割時のリサイズを均等にする
	---- floating windows を半透明にする
	winblend = 20,
	---- scrolloff
	scrolloff = 5, -- カーソルが画面端から何行離れたらスクロールするか

	-- 補完
	---- コマンドライン補完を強化
	wildmenu = true,
	wildmode = "full",
	---- insert モード時の補完オプション
	completeopt = { "menuone", "noinsert", "noselect" },

	-- 検索
	ignorecase = true, -- 大文字無視
	smartcase = true, -- 大文字で検索したら区別する
	wrapscan = true, -- 検索をラップする
	hlsearch = true, -- 検索結果をハイライトする

	-- ファイル環境
	fileencodings = { "ucs-bom", "utf-8", "iso-2022-jp", "sjis", "euc-jp" },
	fileformats = { "unix", "dos", "mac" },

	-- その他
	---- クリップボード
	clipboard = "unnamedplus",
	---- マウスを有効化
	mouse = "a",
	---- 24-bit RGB カラーを有効化(TUI時)
	termguicolors = true,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Diagnostic signs
local diagnostic_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(diagnostic_signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end
