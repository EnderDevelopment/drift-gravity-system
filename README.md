# Drift Gravity System

Enhance your drifting experience with adjustable gravity levels.

## Features

- Adjustable gravity levels for drifting
- Player-specific gravity level saving
- Cooldown system to prevent abuse

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start driftGravitySystem` to your server.cfg
4. Import the database.sql file into your MySQL database

## Usage

- Players can adjust their gravity levels while drifting by holding the left shift key
- Gravity levels can be set to 100, 80, 60, 40, 20, or 10

## Configuration

The script can be configured in the config.lua file:

```lua
Config = {}

Config.GravityLevels = {
    {level = 100, gravity = 0.98},
    {level = 80, gravity = 0.96},
    {level = 60, gravity = 0.94},
    {level = 40, gravity = 0.92},
    {level = 20, gravity = 0.90},
    {level = 10, gravity = 0.88},
    {level = 5, gravity = 0.86}
}

Config.DefaultGravityLevel = 100
Config.DriftCooldown = 5000 -- in milliseconds
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=drift-gravity-system&utm_content=bottom) — describe it in one sentence and get the full source code.
