return {
  cmd = {
    "clangd",     -- NOTE: 只支持clangd 13.0.0 及其以下版本，新版本会有问题
    "--background-index", -- 后台建立索引，并持久化到disk
		"--clang-tidy", -- 开启clang-tidy
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
		-- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
		"--function-arg-placeholders=false",
		"--log=verbose",
		"--ranking-model=decision_forest",
		-- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
		"--header-insertion-decorators",
		"-j=12",
		"--pretty",
  },
  filetype = {
    ".c", ".cc", ".cpp",
  }
}

-- NOTE: generate a .clangd-tidy file under project root dir to enable this feature
-- Checks: "*,
--         -abseil-*,
--         -altera-*,
--         -android-*,
--         -fuchsia-*,
--         -google-*,
--         -llvm*,
--         -modernize-use-trailing-return-type,
--         -zircon-*,
--         -readability-else-after-return,
--         -readability-static-accessed-through-instance,
--         -readability-avoid-const-params-in-decls,
--         -cppcoreguidelines-non-private-member-variables-in-classes,
--         -misc-non-private-member-variables-in-classes,
-- "
-- WarningsAsErrors: ''
-- HeaderFilterRegex: ''
-- FormatStyle:     none
