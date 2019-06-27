# Spigot docker

This repository contains a `Dockerfile` used to start a [Spigot](https://www.spigotmc.org/) in a docker container.

## How to use it?

`start.sh` is a bash script used to create required files. It prevents the docker's default initilization which creates directories instead of files if they do not exist on the host-side. (see [docker doc](https://docs.docker.com/v17.09/engine/admin/volumes/bind-mounts/#choosing-the--v-or-mount-flag) for more details

```sh
# Gives execution-access to the current user 
$ chmod u+x start.sh
# Starts the script
$ ./start.sh
```

> Note: Acceptance of the [Minecraft End User License Agreement](https://account.mojang.com/documents/minecraft_eula) (EULA) is required for the use of a Minecraft server. By default, this contract is accepted. Therefore, by using this Docker image provided in the `docker-compose.yml` file, you accept the Minecraft EULA.

## Ports opened

- `25565`: Minecraft server port
- `25575`: Minecraft server console (remote console, rcon)

## How to use Minecraft RCON?

See [Tiiffi/mcrcon](https://github.com/Tiiffi/mcrcon)
