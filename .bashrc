orgdir="/Users/snd/org/"
dropb="/Users/snd/Dropbox/"
dropb_org="/Users/snd/Dropbox/org/"
arr=("$dropb_org") # An array, to which directories
                   # other than Dropbox can be added, e.g., SpiderOak

function backup () {
    rsync -avz --delete /Users/snd/.emacs.d/ /Users/snd/org/CS/Shell/Emacs/dot_emacs.d/;
    cp ~/.bashrc /Users/snd/org/CS/Shell/;
    cp ~/.bash_profile /Users/snd/org/CS/Shell/;
    cp -a ~/Dropbox/Notes/. ~/BackupNotes/;

    echo -e "\nCopied ~/.emacs.d/ to ~/org/CS/Shell/Emacs/dot_emacs.d/";
    echo -e "Copied ~/.bashrc to ~/org/CS/Shell/";
    echo -e "Copied contents of ~/Dropbox/Notes/ to ~/BackupNotes/";
    echo -e "Now copying all of the other important directories and files\n";

    for i in "${arr[@]}";{
        rsync -avz --delete "$orgdir" "$i"
    }
	     
    echo -e "\ncopied at:" $(date +%m/%d/%y..%H:%M)
}


function todo () {
    mapfile -t lines < <(grep '* TODO' /Users/snd/Dropbox/Notes/refile-beorg.org)
    mapfile -t current_todo < <(reminders show Today)

    printf '%s\n' "${current_todo[@]}" > /Users/snd/Dropbox/Notes/current_todo.org
    
    for (( i=0; i<${#current_todo[@]}; i++)); do
	reminders complete Today 0
    done

    for (( i=0; i<${#lines[@]}; i++)); do
	reminders add Today "${lines[$i]}"
    done
}
