Config = {}

Config.UseLanguage = "en"
Config.UseSoundEffect = true

Config.Elevators = {
    ["PillBoxRestricted"] = {
        Group = {"police", "ambulance"},
        Sound = "liftSoundBellRing",
        Name = "Pillbox Elevator",
        Floors = {
            [1] = {
                Label = "Helicopter Pad",
                FloorDesc = "Elevator To The Roof",
                Restricted = true,
                Coords = vector3(338.51, -583.81, 74.16),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Floor 1",
                FloorDesc = "Elevator To The Main Floor",
                Restricted = true,
                Coords = vector3(327.02, -603.85, 43.28),
                ExitHeading = "337.25"
            },
            [3] = {
                Label = "EMS Garage",
                FloorDesc = "Elevator To The Garage",
                Restricted = true,
                Coords = vector3(340.18, -584.68, 28.8),
                ExitHeading = "104.87"
            },
        }
    },
    ["PillBoxUnRestricted"] = {
        Sound = "liftSoundBellRing",
        Name = "Pillbox Elevator",
        Floors = {
            [1] = {
                Label = "Main Floor",
                FloorDesc = "Take Elevator To Main Floor",
                Coords = vector3(330.43, -601.16, 43.28),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Ground Floor",
                FloorDesc = "Take Elevator To Ground Floor",
                Coords = vector3(345.62, -582.54, 28.8),
                ExitHeading = "262.86"
            },
        }
    }
}

Config.ElevatorButton = {

    ------ / Pill Box Hospital
    -- UnRestricted
    [1] = { name = "Ground Floor", location = vector3(346.10, -581.00, 28.8), width = 0.1, length = 0.3, heading = 69.47, minz = 28.9, maxz = 29.3},
    [2] = { name = "First Floor", location = vector3(330.04, -602.7, 43.28), width = 0.2, length = 0.3, heading = 247.68, minz = 43.48, maxz = 43.78 },

    -- Restricted
    [3] = { name = "EMS Garage", location = vector3(339.48, -586.13, 28.8), width = 0.1, length = 0.3, heading = 246.66, minz = 28.9, maxz = 29.3},
    [4] = { name = "Main Floor", location = vector3(325.65, -603.39, 43.28), width = 0.1, length = 0.3, heading = 160.6, minz = 43.48, maxz = 43.78},
    [5] = { name = "Heli Pad", location = vector3(338.42, -583.71, 74.16), width = 0.5, length = 2.8, heading = 70.21, minz = 74.16 - 1, maxz = 74.16 + 1.5 },

}

Config.Language = {
    ["en"] = {
        Waiting = "Waiting for Elevator...",
        Restricted = "Restricted Access!",
        CurrentFloor = "Current Floor: "
    },
    ["pt"] = {
        Waiting = "À espera do Elevador...",
        Restricted = "Piso restrito!",
        CurrentFloor = "Piso Atual: "
    }
}