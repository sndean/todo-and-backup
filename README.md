# Todo and backup

How I deal with todo lists and backing up data

![](https://github.com/sndean/copyImportant/raw/master/example.png)

## Things you need:

These include accounts, programs, tools, and directories. Overall, it is only set up to work on macOS, but pieces of it will certain be useable on a Linux machine.

* A Dropbox account
 
  * `~/Dropbox/Notes`
  
    * For the todo list, use the `refile-beorg.org` file that's default in beorg
  
  * `~/Dropbox/org`
  
* New Tab Redirect: https://chrome.google.com/webstore/detail/new-tab-redirect/icpgjfneehieebagbmdbhnlpiopdcmna
  
  * Displays the `current_todo.org` created in ~/Dropbox/Notes
  
      - Always update tab, not redirect

* bitbar: https://getbitbar.com/

  * Todo List plugin: https://getbitbar.com/plugins/Tools/todolist.2m.sh
  * Slightly modified Github Contribution plugin: https://getbitbar.com/plugins/Dev/GitHub/github-contribution.10m.rb
  * Weather - OpenWeatherMap plugin: https://getbitbar.com/plugins/Weather/OpenWeatherMap/weather.15m.py
  * Clock with calendar plugin: https://getbitbar.com/plugins/Time/CalendarLite.1m.sh

* Apple Reminders app:
https://support.apple.com/en-us/ht205890

* reminders-cli, a commandline interface for Reminders:
https://github.com/keith/reminders-cli

* `~/.bashrc`

  * `backup` function [here](/.bashrc)

    * Backs up files contained within `~/org` to `~/Dropbox/org`
    * Copies notes from `~/Dropbox/Notes` to `~/BackupNotes`
    * Copies `~/emacs.d/`, `~/.bashrc`, and `~/.bash_profile`
  
  * `todo` function [here](/.bashrc)

    * Currently takes lines from `~/Dropbox/Notes/refile-beorg.org` and puts them in the array `lines` 
      - Counts them
      - Iterates over them (0 to count)
      - For each iteration, adds the line to the `Today` Reminders todo list via the reminders-cli.

* `~/BackupNotes`

* beorg: http://beorgapp.com/

* `~/org`



