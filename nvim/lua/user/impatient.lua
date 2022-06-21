local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify("not find impatient, " .. impatient)
  return
end

impatient.enable_profile()
