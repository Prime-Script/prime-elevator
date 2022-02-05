# qb-lift

# Dependency

- QBCore Framework - https://github.com/qbcore-framework/qb-core

- QB-Target - https://github.com/BerkieBb/qb-target

# Optional Dependency

- Interact Sound - https://github.com/qbcore-framework/interact-sound

# How To?

- This is how you add more targets to the script

```
[1] = { name = "CHANGE_NAME_HERE", location = vector3(x, y, z), width = 1, length = 1, heading = h, minz = z - 1, maxz = z + 1},
```

This is how you add more working elevators to the script

```
["CHANGE_NAME_HERE"] = {
        Sound = "liftSoundBellRing", -- This sound must be inside interact-sound / client / html / sounds
        Name = "CHANGE_NAME_HERE",
        Floors = {
            [1] = {
                Label = "CHANGE_NAME_HERE",
                FloorDesc = "CHANGE_NAME_HERE",
                Coords = vector3(330.43, -601.16, 43.28),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "CHANGE_NAME_HERE",
                FloorDesc = "CHANGE_NAME_HERE",
                Coords = vector3(345.62, -582.54, 28.8),
                ExitHeading = "262.86"
            },
        }
    }
```

# Credit KUMApt#0001 (Original Script)

- This Script Is With 3D Draw Text

https://github.com/DanielCoelh0/qb-lift