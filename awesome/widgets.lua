vicious = require("vicious")
naughty = require("naughty")
awful = require("awful")
wibox = require("wibox")

cpuwidgett = wibox.widget.progressbar()
cpuwidgett.background_color = "#494949"
cpuwidgett.color = { type = "linear", from = { 0, 0 }, to = { 20,0 }, stops = { {0, "#7070F0"}, {0.3, "#3030F0"}, {0.5, "#0000FF"}, {0.7, "#c0c0FF"}, {1, "#FFFFFF" }}}
cpuwidgett.height = 10
cpuwidget = wibox.container.rotate(cpuwidgett, "east")
vicious.register(cpuwidgett, vicious.widgets.cpu, "$1")

memwidgett = wibox.widget.progressbar()
memwidgett.background_color = "#494B4F"
memwidgett.border_color = "#000000"
memwidgett.height = 10
--memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#007700"}, {0.5, "#00FF00"}, 
--                    {1, "#FFFFFF"}}})
memwidgett.color = { type = "linear", from = { 0, 0 }, to = { 0,10 }, stops = { {0, "#007700"}, {0.5, "#00FF00"}, 
                    {1, "#00FF00"}}}
memwidgett:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/memory.sh") end)))
memwidget = wibox.container.rotate(memwidgett, "east")
vicious.register(memwidgett, vicious.widgets.mem, "$1", 13)

memwidgett2 = awful.widget.progressbar()
memwidgett2.background_color = "#494B4F"
memwidgett2.border_color = "#000000"
memwidgett2.height = 10
memwidgett2.color = { type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
                    {1, "#FF5656"}}}
memwidgett2:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/memory.sh") end)))
memwidget2 = wibox.container.rotate(memwidgett2, "east")
vicious.register(memwidgett2, vicious.widgets.mem, "$5", 13)



        --local f,err = io.open("/tmp/lua.test","w") 
        --t = {['foo']='bar',11,22,33}
        --for k, v in pairs( args ) do
        --    f:write(k)
		--	f:write(" ")
        --    f:write(v)
		--	f:write("\n")
        --end
        --f:close()


--batwidget = wibox.widget.textbox()
--vicious.register(batwidget, vicious.widgets.bat, "$1 $2 $3 $4", 12, "BAT0")
batwidgett = awful.widget.progressbar()
batwidgett.width = 10
batwidgett.height = 10
batwidgett.vertical = true
batwidgett.background_color = "#494B4F"
batwidgett.border_color = "#000000"
batwidgett.color = {type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#00FF00"}, {0.5, "#88A175"}, {1.0, "#FF0000"} } }
batwidgett:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/battery.sh") end)))
batwidget = wibox.container.rotate(batwidgett, "east")

vicious.register(batwidgett, vicious.widgets.bat, function (batwidget, args)
      tmp = nil

      if args[1] == "+" then       -- if charging
        batwidget:set_background_color("#006600")
        if tmp == "0x300" then     -- if performance mode
       	  batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#FF0000"}, {0.5, "#FF0000"}, {1.0, "#FF0000"} } })
        elseif tmp == "0x302" then -- if powersave mode
          batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#0000FF"}, {0.5, "#0000FF"}, {1.0, "#0000FF"} } })
        else                       -- normal mode
          batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#00FF00"}, {0.5, "#00FF00"}, {1.0, "#00FF00"} } })
        end
      else                         -- if not charging
        batwidget:set_background_color("#494B4F")
        if tmp == "0x300" then     -- performance mode
       	  batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#FF0000"}, {0.5, "#FFFF00"}, {1.0, "#000000"} } })
        elseif tmp == "0x302" then -- powersave mode
          batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#0000FF"}, {0.5, "#FFFF00"}, {1.0, "#FF0000"} } })
        else                       -- normal mode
          batwidget:set_color({type="linear", from = {0, 0}, to = {20, 0}, stops = { {0, "#FF0000"}, {0.6, "#FFFF00"},{0.7, "#FFFF00"}, {1.0, "#00FF00"} } })
        end
      end
	  if args[2] <= 10 and args[1] ~= "+" then
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Low Battery!!",
                         text = "Battery at " .. args[2] .. "%!"  })
      end
      return args[2]
    end, 10, "BAT0") 
--vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0") 

