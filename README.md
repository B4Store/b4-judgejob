# b4-judgejob With Car & Map
# Script Information

- Author : i.dx
- Description : Judge\Court Job

# (Contact Us)

- If you have another problem or question please contact me

- Discord : ( https://discord.gg/b4s )
- Discord : ( https://discord.gg/NvbDy6j4Qd )

# (Preview)
- https://vimeo.com/843001164

# (You Must Make This)
- You Must Change Name From `b4-judgejob-main` For `b4-judgejob`

# QB Depends (Standalone scripts)

- QBCore
- https://github.com/qbcore-framework/qb-core
- https://github.com/qbcore-framework/qb-menu
- https://github.com/qbcore-framework/qb-target

- Car & Map (You Must DownLoad It)
- https://www.mediafire.com/file/zpqgebjvdxhrbkw/[judge-job].rar/file

# This Important Things You Must To Add It

* Add This in (qb-core\shared\jobs)

```lua
	['judge'] = {
		label = 'Honorary',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'lawyer',
                payment = 100
            },
            ['1'] = {
                name = 'Judge',
                payment = 1000
            },
        },
	},
```

* Add This in (qb-core\shared\items)

```lua
-- \\ Court
["court_key"] = {
        ["name"] = "court_key",
        ["label"] = "Court Keys",
        ["weight"] = 0,
        ["type"] = "item",
        ["unique"] = false,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["image"] = "courtkey.png",
        ["description"] = "Court Keys For Court Place"
    },
```

* Add judgehammer.ogg in (interact-sound\client\html\sounds)

* Add courtkey.png in (qb-inventory\html\images)

* Add This File in (qb-doorlock\configs)
