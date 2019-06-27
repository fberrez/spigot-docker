# Colors
GREEN="\033[0;32m"
NC="\033[0m"

# path where docker volume will be linked.
path="server/"

# files_to_create contains name of required files for spigot
files_to_create=(config.yml spigot.yml server.properties bukkit.yml banned-ips.json banned-players.json whitelist.json)
# directories_to_create contains name of required directories for spigot
directories_to_create=(world world_nether world_the_end plugins)

# Checks if path already exists. If it does not, it makes it.
if [ ! -d ${path} ]; then
    mkdir ${path}

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}directory '${path}' successfully created!${NC}"
    fi
fi

# for each file contained in files_to_create, it checks if this exist.
# If it do not exist, it creates it.
for file in ${files_to_create[@]}; do
    if [ ! -f ${path}${file} ]; then
        touch ${path}${file}

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}file '${path}${file}' successfully created!${NC}"
        fi
    fi
done

# It does the same than the last loop but with required
# directories for spigot
for dir in ${directories_to_create[@]}; do
    if [ ! -d ${path}${dir} ]; then
        mkdir ${path}${dir}

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}directory '${path}${dir}' successfully created!${NC}"
        fi
    fi
done

# Starts spigot in a docker container
docker-compose up -d
