#/bin/bash
sudo apt-get install openbox konsole lxrandr tint2 conky xautolock gmrun suckless-tools scrot orage volumeicon-alsa

backup_string=$(date '+%d_%m_%Y_%H_%M_%S')

for i in $(find .config/ -type f); do
    new_file="${i}"
    file_location="$HOME/${new_file}"
    echo "Processing file ${new_file}"
    echo "if [ -f ${file_location} ]; then"
    if [ -f ${file_location} ]; then
        backup_file=${file_location}${backup_string}
        echo "Backing up ${file_location} to ${backup_file}"
        cp ${file_location} ${backup_file}
    fi
    echo "Deploying dile ${new_file} on ${file_location}"
    cp ${new_file} ${file_location}
done