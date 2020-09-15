# Switch Drivers script (MacOS Only)

## Install and Remove

Execute in terminal:

```bash
# To install globally at user level
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ddubson/.scripts/main/install-switch-drivers.sh)"

# To remove globally
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ddubson/.scripts/main/remove-switch-drivers.sh)"
```

## Usage

After install, just run in a shell within your git repository:

```bash
switch-drivers
```

### Basic Steps

- Install the script just once (there’s an installer script to install the script!) — it’ll be available in your shell globally at user level on your Mac.
- Start working on a story with your pair - create a new feature branch and start working on some code (the script will not allow working on main/master/dev branches)
- When you’re ready to switch whoever is driving, execute `switch-drivers` in the root of your git repo
- The script creates the exact command the person who is ready to drive needs to get going on their side — the driver gets it on the clipboard automatically, and can copy it over to a chat window by a simple `cmd+v`
- The new driver will now copy the command into their terminal and pulls the latest code. 
- Switch screen share and keep on coding!
- Rinse and repeat the flow until feature is ready to ship. At that point, just collapse all the `WIP` commits created by the script into a single feature commit.
- If you don’t want the tool anymore, run the remove script to get rid of it from your system.
