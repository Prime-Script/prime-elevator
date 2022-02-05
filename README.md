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

- How to add elevator with permissions & with sound

```
["CHANGE_NAME_HERE"] = {
    Group = {"police", "ambulance"}, -- Add jobs to be granted access to use the elevator
    Sound = "SOUND_NAME_HERE", -- This sound must be inside interact-sound / client / html / sounds
    Name = "CHANGE_NAME_HERE",
    Floors = {
        [1] = {
            Label = "CHANGE_NAME_HERE",
            FloorDesc = "CHANGE_NAME_HERE",
            Restricted = true,
            Coords = vector3(x, y, z),
            ExitHeading = "h"
        },
        [2] = {
            Label = "CHANGE_NAME_HERE",
            FloorDesc = "CHANGE_NAME_HERE",
            Restricted = true,
            Coords = vector3(x, y, z),
            ExitHeading = "h"
        },
    }
}
```

- How to add elevator without permissions & without sound

```
["CHANGE_NAME_HERE"] = {
    Name = "CHANGE_NAME_HERE",
    Floors = {
        [1] = {
            Label = "CHANGE_NAME_HERE",
            FloorDesc = "CHANGE_NAME_HERE",
            Coords = vector3(x, y, z),
            ExitHeading = "h"
        },
        [2] = {
            Label = "CHANGE_NAME_HERE",
            FloorDesc = "CHANGE_NAME_HERE",
            Coords = vector3(x, y, z),
            ExitHeading = "h"
        },
    }
}
```

# Credit KUMApt#0001 (Original Script)

- This Script Is With 3D Draw Text

https://github.com/DanielCoelh0/qb-lift