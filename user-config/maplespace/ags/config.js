// || || Used https://github.com/Aylur/ags/blob/main/example/simple-bar/config.js || || //
/* Todos
    * Calendar
    * Keep awake thing
    * Microphone
    * WiFi (provided by applet already though)
    * CPU/GPU/Temp/Whatever tracking
    * Caps lock + Num Lock tracking
    * Proper media controls
    * */

// Imports //
const hyprland = await Service.import("hyprland")
const notifications = await Service.import("notifications")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
const systemtray = await Service.import("systemtray")

// Date + Time //
const datePoll = Variable("", {
    poll: [1000, 'date "+%A %b. %d, %Y"'],
})
const timePoll = Variable("", {
    poll: [1000, 'date "+%T"']
})

// Hyprland Workspaces //
// Function so we can reuse widgets for different monitors
function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
        })))

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}

// Clock //
function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: timePoll.bind(),
    })
} // todo (maybe): on click or hover open calendar; add a hoverbox with %f (UNIX time)
// Calendar WIP //
function Calendar() {
    return Widget.Label({
        class_name: "calendar",
        label: datePoll.bind(),
    })
}

// Notifications //
function Notification() {
    const popups = notifications.bind("popups")
    return Widget.Box({
        class_name: "notification",
        visible: popups.as(p => p.length > 0),
        children: [
            Widget.Icon({
                icon: "preferences-system-notifications-symbolic",
            }),
            Widget.Label({
                label: popups.as(p => p[0]?.summary || ""),
            }),
        ],
    })
}



// Media Controls //
function Media() {
    const label = Utils.watch("", mpris, "player-changed", () => {
        if (mpris.players[0]) {
            const { track_artists, track_title } = mpris.players[0]
            const playerLabel = `${track_artists.join(", ")} - ${track_title}`
            return playerLabel.length >= 20 ? playerLabel.slice(0, 15) + '...' : playerLabel
        } else {
            return "Nothing is playing"
        }
    })

    // todo: change to having like real buttons or something
    return Widget.Button({
        class_name: "media",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label({ label }),
    })
}

// Volume Controls //
function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Button({
        child: Widget.Icon({
            icon: Utils.watch(getIcon(), audio.speaker, getIcon),
        }),
        onClicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
    })

    const volumeSlider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 180px",
        children: [icon, volumeSlider],
    })
}
function Microphone() {
    const icons = {
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.microphone.is_muted ? 0 : [67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `microphone-sensitivity-${icons[icon]}-symbolic`
    }

    const icon = Widget.Button({
        child: Widget.Icon({
            icon: Utils.watch(getIcon(), audio.microphone, getIcon),
        }),
        onClicked: () => audio.microphone.is_muted = !audio.microphone.is_muted,
    })

    const micSlider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.microphone.volume = value,
        setup: self => self.hook(audio.microphone, () => {
            self.value = audio.microphone.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "microphone",
        css: "min-width: 180px",
        children: [icon, micSlider],
    })
}
/*function VolumeBox() {
    return Widget.Box({
        class_name: "volumeBox",
        css: "min-width: 180px",
        vertical: true,
        homogeneous: true,
        children: [Volume(), Microphone()],
    })
}
function VolumeCircle() {
    return Widget.CircularProgress({
        css: 'min-width: 50px;'  // its size is min(min-height, min-width)
            + 'min-height: 50px;'
            + 'font-size: 6px;' // to set its thickness set font-size on it
            + 'margin: 4px;' // you can set margin on it
            + 'background-color: #00f;' // set its bg color
            + 'color: lime;', // set its fg color
        rounded: true,
        startAt: 0,
        endAt: 1,
        value: audio.speaker.volume,
        child: Widget.Icon({
            icon: Utils.watch('audio-volume-high-symbolic', audio.speaker),
        }),
    })
}
function VolumeBox() {
    return Widget.Button({
        child: Widget.Box({
            homogeneous: true,
            vertical: true,
            children: [
                VolumeCircle()
            ]
        }),
        onClicked: 
    })
}
*/
// Battery //
function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.LevelBar({
                widthRequest: 140,
                vpack: "center",
                value,
            }),
        ],
    })
}

// System Tray //
function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
            child: Widget.Icon({ icon: item.bind("icon") }),
            on_primary_click: (_, event) => item.activate(event),
            on_secondary_click: (_, event) => item.openMenu(event),
            tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        children: items,
    })
}

// layout of the bar
function Left() {
    return Widget.Box({
        spacing: 8,
        children: [
            Workspaces(),
            Media(),
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
            Calendar(),
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            //VolumeButton(),
            Volume(),
            Microphone(),
            BatteryLabel(),
            Clock(),
            SysTray(),
            Notification(),
        ],
    })
}

// Bar //
function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}

// GTK App Config //
App.config({
    //style: "./style.css",
    windows: [
        Bar(),

        // you can call it, for each monitor
        // Bar(0),
        // Bar(1)
    ],
})
