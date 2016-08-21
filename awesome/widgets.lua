vicious = require("vicious")
naughty = require("naughty")
awful = require("awful")

cpuwidget = awful.widget.progressbar()
cpuwidget:set_width(10)
cpuwidget:set_height(10)
cpuwidget:set_vertical(true)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#7070F0"}, {0.5, "#0000FF"}, 
                    {1, "#FFFFFF" }}})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

memwidget = awful.widget.progressbar()
memwidget:set_width(10)
memwidget:set_height(10)
memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color("#000000")
--memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#007700"}, {0.5, "#00FF00"}, 
--                    {1, "#FFFFFF"}}})
memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0,10 }, stops = { {0, "#007700"}, {0.5, "#00FF00"}, 
                    {1, "#00FF00"}}})
memwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/memory.sh") end)))
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)

memwidget2 = awful.widget.progressbar()
memwidget2:set_width(10)
memwidget2:set_height(10)
memwidget2:set_vertical(true)
memwidget2:set_background_color("#494B4F")
memwidget2:set_border_color("#000000")
memwidget2:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
                    {1, "#FF5656"}}})
memwidget2:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/memory.sh") end)))
vicious.register(memwidget2, vicious.widgets.mem, "$5", 13)



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
batwidget = awful.widget.progressbar()
batwidget:set_width(10)
batwidget:set_height(10)
batwidget:set_vertical(true)
batwidget:set_background_color("#494B4F")
batwidget:set_border_color("#000000")
batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#00FF00"}, {0.5, "#88A175"}, {1.0, "#FF0000"} } })
batwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(".config/awesome/status_stuff/battery.sh") end)))

vicious.register(batwidget, vicious.widgets.bat, function (batwidget, args)
      tmp = nil

      if args[1] == "+" then       -- if charging
        batwidget:set_background_color("#00dd00")
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
          batwidget:set_color({type="linear", from = {0, 0}, to = {0, 20}, stops = { {0, "#00FF00"}, {0.5, "#FFFF00"}, {1.0, "#FF0000"} } })
        end
      end
	  if args[2] <= 10 and args[1] ~= "+" then
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Low Battery!!",
                         text = "Battery at " .. args[2] .. "%!"  })
      end
      return args[2]
    end, 61, "BAT0") 
--vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0") 

