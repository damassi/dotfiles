local M = {}

local watchers = {}
local watch_file

local function stop_watch(buf)
  local handle = watchers[buf]
  if handle then
    handle:stop()
    handle:close()
    watchers[buf] = nil
  end
end

watch_file = function(buf)
  local file = vim.api.nvim_buf_get_name(buf)
  if file == "" then
    return
  end

  stop_watch(buf)

  local handle = vim.uv.new_fs_event()
  if not handle then
    return
  end

  watchers[buf] = handle
  handle:start(file, {}, function(err)
    if err then
      return
    end
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("checktime")
        end)
        stop_watch(buf)
        watch_file(buf)
      end
    end)
  end)
end

M.setup = function()
  vim.opt.autoread = true

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function(args)
      watch_file(args.buf)
    end,
  })

  vim.api.nvim_create_autocmd("BufDelete", {
    pattern = "*",
    callback = function(args)
      stop_watch(args.buf)
    end,
  })
end

return M
