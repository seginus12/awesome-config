local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

-- Create brightness widget

brightness = wibox.widget {
    max_value     = 255,
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

local brightness_icon = wibox.widget({
	image = "/home/volchara/.config/awesome/icons/brightness.svg",
	resize = true,
	widget = wibox.widget.imagebox,
})

local brightness_widget = {
    {
        {
            {
                {
                    {
                        {
                            {
                                {
                                    widget = brightness_icon,
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
                                    widget = brightness,
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

return brightness_widget