#Backup project
#Muhammad Faraz Sohail
#!/bin/bash

#date to string
date=$(date|tr ": " "0")

#filename
arch="archive.tar"

#message for user
echo "Backing up files from $sf to $df/$arch"

if[[$1 -ne "-t"]]; then
	dir=$pwd; mkdir $pwd/$date
	for((i=1;i<$#;i++))
	do
		cp ~/$pwd/*$(i) ~/$pwd/$date
	done
	tar -cvpzf ~/$pwd/$arch ~/$pwd/$date
	rm ~/$pwd/$date
else
	dir=$2; mkdir $dir/$date
	for((i=3;i<$#;i++))
	do
		cp ~/$pwd/*$(i) ~/$dir/$date
	done
	tar -cvpzf ~/$dir/$arch ~/$pwd/$date
	rm ~/$pwd/$date
fi

#message for user
echo "Backup finished!"
ls -l ~/$dir/$arch