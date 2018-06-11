# Other stuff above

##### Backup start #########################################

# Organization of org:
## /Users/snd/org/             
## /Users/snd/Dropbox/org/

# Rules for org:
## Try to avoid files larger than a large book ~50 MB
## /org should be organized into ~10 subdirectories
## The location of /dot_emacs.d and  ~/.bashrc is important
### These should be copied to the same location each time

orgdir="/Users/snd/org/"
dropb="/Users/snd/Dropbox/"
dropb_org="/Users/snd/Dropbox/org/"
arr4=("$dropb_org") # You can add things other than Dropbox in this list

function copy_important () {
    rsync -avz --delete /Users/snd/.emacs.d/ /Users/snd/org/CS/Shell/Emacs/dot_emacs.d/;
    cp ~/.bashrc /Users/snd/org/CS/Shell/;
    cp ~/.bash_profile /Users/snd/org/CS/Shell/;

    echo -e "\nCopied ~/.emacs.d/ to ~/org/CS/Shell/Emacs/dot_emacs.d/";
    echo -e "Copied ~/.bashrc to ~/org/CS/Shell/";
    echo -e "Now copying all of the other important directories and files\n";

    for i in "${arr4[@]}";{
        rsync -avz --delete "$orgdir" "$i"
    }

    echo -e "\ncopied at:" $(date +%m/%d/%y..%H:%M)
}

##### Backup end ################################################

# Other stuff below
