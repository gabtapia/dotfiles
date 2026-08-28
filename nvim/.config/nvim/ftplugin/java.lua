local mason_registry = require("mason-registry")

if mason_registry.has_package("jdtls") then
	local jdtls_pkg = mason_registry.get_package("jdtls")
	local jdtls_path = jdtls_pkg:get_install_path()

	local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local config_dir = jdtls_path .. "/config_win"
	local lombok_path = jdtls_path .. "/lombok.jar"

	local root_files = vim.fs.find(
		{ "gradlew", ".git", "mvnw", "pom.xml", "build.gradle", "build.xml", ".classpath", ".project" },
		{ upward = true, path = vim.api.nvim_buf_get_name(0) }
	)

	local root_dir
	if #root_files > 0 then
		root_dir = vim.fs.dirname(root_files[1]) --
	else
		root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) --
	end

	local workspace_dir = vim.fn.stdpath("data")
		.. "/site/java/workspace-root/"
		.. vim.fn.fnamemodify(root_dir, ":p:h:t") --

	local config = {
		cmd = { --
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-javaagent:" .. lombok_path,
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",

			"-jar",
			launcher_jar,
			"-configuration",
			config_dir,
			"-data",
			workspace_dir,
		},
		root_dir = root_dir, --
		settings = {
			java = {
				project = {
					referencedLibraries = {
						-- Busca recursiva de todos os JARs na pasta 'lib' da raiz do seu projeto
						root_dir .. "/lib/**/*.jar",
						-- Caso o seu projeto também use JARs salvos em outras subpastas específicas
						-- root_dir .. "/vendor/*.jar",
					},
				},
			},
		},
	}

	require("jdtls").start_or_attach(config) --

	local java_augroup = vim.api.nvim_create_augroup("JavaFormatting", {}) --
	vim.api.nvim_create_autocmd("BufWritePre", { --
		group = java_augroup, --
		pattern = "*.java", --
		callback = function() --
			vim.lsp.buf.format({ async = false }) --
		end, --
	}) --
else
	vim.notify("Servidor jdtls não detectado na pasta do Mason.", vim.log.levels.WARN) --
end
