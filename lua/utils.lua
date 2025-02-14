local M = {}

M.get_wday = function(wday)
  local cur_time = os.time()
  local cur_wday = os.date('*t', cur_time).wday
  return os.date('%Y-%m-%d|%A', cur_time + (wday - cur_wday) * 86400)
end

M.get_week_link = function(date)
  local d_table = os.date('*t', date)
  local day = d_table.day
  local yday = d_table.yday
  local jan1 = os.date('*t', os.time { year = d_table.year, month = 1, day = 1 }).wday
  local first_day = os.date('*t', os.time { year = d_table.year, month = d_table.month, day = 1 }).wday

  -- Calculate the month week number
  local m_week = math.ceil((day + first_day - 1) / 7)

  -- Calculate the year week number
  local y_week = math.floor((yday + jan1 - 1) / 7)

  return string.format('%d-%02d', d_table.year, y_week) .. '|' .. string.format('W%d of %s', m_week, os.date('%B, %Y', date))
end
return M
