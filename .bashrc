orgdir="/Users/snd/org/"
dropb="/Users/snd/Dropbox/"
dropb_org="/Users/snd/Dropbox/org/"
arr4=("$dropb_org") # An array, to add thing in addition to Dropbox, e.g., SpiderOak

function backup () {
    rsync -avz --delete /Users/snd/.emacs.d/ /Users/snd/org/CS/Shell/Emacs/dot_emacs.d/;
    cp ~/.bashrc /Users/snd/org/CS/Shell/;
    cp ~/.bash_profile /Users/snd/org/CS/Shell/;
    cp -a ~/Dropbox/Notes/. ~/BackupNotes/;

    echo -e "\nCopied ~/.emacs.d/ to ~/org/CS/Shell/Emacs/dot_emacs.d/";
    echo -e "Copied ~/.bashrc to ~/org/CS/Shell/";
    echo -e "Copied contents of ~/Dropbox/Notes/ to ~/BackupNotes/";
    echo -e "Now copying all of the other important directories and files\n";

    for i in "${arr4[@]}";{
        rsync -avz --delete "$orgdir" "$i"
    }
	     
    echo -e "\ncopied at:" $(date +%m/%d/%y..%H:%M)
}


function todo () {
IFS=$'\n' read -d '' -r -a lines < /Users/snd/Dropbox/Notes/todo.org
num1=$(wc -l < /Users/snd/Dropbox/Notes/todo.org)
num=$((num1 - 1))

for ((i=0; i<=$num; i++)); do
    # printf '%s\n' "${lines[$i]}"
    reminders add Today "${lines[$i]}"
done
}
