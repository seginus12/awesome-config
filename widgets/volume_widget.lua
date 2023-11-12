local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

-- Create volume widget
volume = wibox.widget {
    max_value     = 100,
    ticks         = true,
    ticks_size    = 4,
    ticks_gap     = 1,
    forced_width  = 50,
    shape         = gears.shape.rounded_bar,
    -- border_width  = 2,
    -- border_color  = "#000000",
    color         = "#B0FC38",
    background_color = "#3CB043",
    widget        = wibox.widget.progressbar,
}

local volume_icon = wibox.widget({
	image = "/home/volchara/.config/awesome/icons/audio.svg",
	resize = true,
	widget = wibox.widget.imagebox,
})

local volume_widget = wibox.widget {
    {
        {
            {
                {
                    {
                        {
                            {
                                {
                                    widget = volume_icon,
                                },
                                valign = 'center',
                                layout = wibox.container.place
                            },
                            top = 1,
                            bottom = 1,
                            widget = wibox.container.margin
                        },
                        {
                            {
                                {
                                    widget = volume,
                                },
                                height = 8,
                                widget = wibox.container.constraint
                            },
                            halign = "center",
                            widget = wibox.container.place,
                        },
                        spacing = 2,
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left = 4,
                    right = 4,
                    widget = wibox.container.margin,
                },
                shape = gears.shape.rounded_bar,
                fg = "#f38ba8",
                bg = "#3c3c3c",
                widget = wibox.container.background,
            },
            height = 16,
            widget = wibox.container.constraint,
        },
        halign = "center",
        widget = wibox.container.place,
    },
    widget = wibox.container.background,
}

local volume_popup = awful.popup {
    widget = {
        {
            {
                text   = 'foobar',
                widget = wibox.widget.textbox
            },
            {
                {
                    text   = 'foobar',
                    widget = wibox.widget.textbox
                },
                bg     = '#ff00ff',
                clip   = true,
                shape  = gears.shape.rounded_bar,
                widget = wibox.widget.background
            },
            {
                value         = 0.5,
                forced_height = 30,
                forced_width  = 100,
                widget        = wibox.widget.progressbar
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 10,
        widget  = wibox.container.margin
    },
    border_color = '#00ff00',
    border_width = 5,
    -- placement    = awful.placement.top_right,
    shape        = gears.shape.rounded_rect,
    visible      = false,
    ontop        = true,
}

volume_widget:connect_signal("button::press", function(_, _, _, button)
	if button == 3 then
		if volume_popup.visible == false then
            volume_popup:move_next_to(mouse.current_widget_geometry)
        else
            volume_popup.visible = false
        end
	elseif button == 1 then
		awful.spawn.with_shell(
			"pavucontrol"
		)
	end
end)

-- Different way to define buttons
--volume_container:buttons(gears.table.join(
 --   volume_container:buttons(),
   -- awful.button({}, 3, nil, function()
     --   naughty.notify({preset=naughty.config.presets.normal, title="debug", text=tostring(volume_popup.visible)})
       -- volume_popup.visible = not volume_popup.visible
        --volume_popup:move_next_to(mouse.current_widget_geometry)

        --volume_popup.visible = not volume_popup.visible
        -- local table = mouse.current_widget_geometry
        -- table_to_file(mouse.current_widget_geometry)
        -- testlua.serialize(table)
        -- naughty.notify({preset=naughty.config.presets.normal, title="debug", text=serialize(table)})
        -- gears.debug.dump(mouse.current_widgets)
    --end),
    --volume_container:buttons(),
    --awful.button({}, 1, nil, function()
    --    awful.spawn("pavucontrol")
    --end)
--))

return volume_widget
