# qb-lift

# Dependency

QBCore Framework - https://github.com/qbcore-framework/qb-core

QBCore Target - https://github.com/BerkieBb/qb-target

# Optional Dependency

Interact Sound - https://github.com/qbcore-framework/interact-sound

# How To?

This is how you add more targets to the script

``[1] = { name = "Ground Floor", location = vector3(x, y, z), width = 1, length = 1, heading = h, minz = z - 1, maxz = z + 1},``

This is how you add more working elevators to the script

```
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
    ```