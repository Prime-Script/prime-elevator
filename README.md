# qb-lift

# Preview

- The script is currently set up to (Gabz PillBox Hosptial)

https://streamable.com/kcj95a

# Dependency

- QBCore Framework - https://github.com/qbcore-framework/qb-core

- QB-Target - https://github.com/BerkieBb/qb-target

# Optional Dependency

- Interact Sound - https://github.com/qbcore-framework/interact-sound (The sound used can be found in sounds)

# How To?

- How to add target for elevator 

```
[1] = { name = "CHANGE_NAME_HERE", location = vector3(x, y, z), width = 1, length = 1, heading = h, minz = z - 1, maxz = z + 1},
```

- How to add elevator with permissions & with sound

```
["CHANGE_NAME_HERE"] = {
    Group = {"police", "ambulance", "cartel", "lostmc"}, -- Add Jobs / Gangs to be granted access to use the elevator
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

# License

This script provided by Prime Scripts, is under the protection of [Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg