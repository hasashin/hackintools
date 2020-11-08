# Open given file/folder in Visual Studio Code
alias openvs='open -a Visual\ Studio\ Code $* 2> /dev/null'

# Mount EFI partition
function mountefi() {
	local mountDisk
	local guid
	local tempFile='/tmp/mountefi'
	if [[ $# > 0 ]]; then
		key="$1"
		if [[ "$key" == "default" ]]; then 
			if [[ -v MOUNTEFI_DEFAULT_VOLUME_GUID ]]; then
				guid=$MOUNTEFI_DEFAULT_VOLUME_GUID
			else
				echo "There's no default volume guid set!" 
				echo "Please export MOUNTEFI_DEFAULT_VOLUME_GUID variable to use 'default' option."
			fi
		elif [[ "$key" == "list" ]]; then
			LISTONLY=YES
		elif [[ "$key" == "help" || "$key" == "--help" ]]; then
			echo "Usage: efimount [option]"
			echo "Available options:"
			echo "\tdefault\t\tmounts default efi volume defined in MOUNTEFI_DEFAULT_VOLUME_GUID variable"
			echo "\tlist\t\tlists available efi volumes"
			echo "\t/dev/diskx\tmounts given partition"
			echo "\thelp\t\tdisplays this message"
			return 0
		else
			echo "Unknown option: \"$key\""
			echo "run: \"$0 help\" to show available usage"
			return -1
		fi
	fi
	diskutil list -plist physical > $tempFile 2> /dev/null
	if [[ -z "$guid" ]]; then

		
		#print usable information about EFI partitions

		if [[ -n "$LISTONLY" ]]; then
			return 0
		fi
		rm -f $tempFile 2> /dev/null
		return -1
		#chose disk	
	fi
	mountDisk="/dev/$(cat $tempFile | grep -B 11 -h $guid | grep -ho 'disk.s.')"
	rm -f $tempFile 2> /dev/null
	sudo mkdir "/Volumes/EFI-$guid"
	sudo mount -t msdos $mountDisk "/Volumes/EFI-$guid" > /dev/null
	[[ -e "/tmp/mountedEfi" ]] && echo "$mountDisk " >> "/tmp/mountedEfi" || echo "$mountDisk " > "/tmp/mountedEfi"
	return 0
}

function umountefi() {
	local mountedEfis
	if [[ -e "/tmp/mountedEfi" ]]; then 
		mountedEfis="$(cat /tmp/mountedEfi)"
		for i in $mountedEfis; do 
			diskutil umount force $i > /dev/null
		done
		rm -f "/tmp/mountedEfi" 2> /dev/null
	fi
}

function oc() {
	autoload -X
}