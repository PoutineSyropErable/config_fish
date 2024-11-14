#!/bin/bash
if status is-interactive
	# Commands to run in interactive sessions can go here
end
###
thefuck --alias | source
alias f="fuck"
atuin init fish --disable-up-arrow | source
# starship init fish | source
source ~/.config/lf/lf.fish



export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"


export TERMINAL=kitty
export BROWSER=firefox
# export VISUAL=neovide ## nano for example
export EDITOR=nvim

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
# You need to also export this in whatever code runs this


alias timeshift-wayland="sudo -E timeshift-gtk"
alias cd="z"
alias j="z"
#zoxide is better i think
alias et="exit"
alias lg="lazygit"


#atuin init fish --disable-ctrl-r --disable-up-arrow | source
alias ga="git add ."
alias gdf="git diff --name-only"
function gc
	git commit -m "$argv"
end

alias gcm="gc"
alias git_file_diff="git diff --name-only HEAD"
alias gfd="git_file_diff"

alias gpd="git push origin desktop"
alias gpl="git push origin laptop"
alias gpm="git push origin master"

function gcl
	cd ~/.config
	git checkout laptop
	cd -
end

function gcd
	cd ~/.config
	git checkout desktop
	cd -
end


#This is to get the n_th element of a bash array. (counts starts at 1)
# So echo "aaa bbb ccc" | get 2 = "bbb" 
function get
	set -l n $argv[1]
	awk "{print \$$n}"
end

function execp
    nohup $argv >> /dev/null &
end



alias svim="sudo -E nvim"
alias ovim="/usr/bin/vim"
alias vim="nvim"
alias nano="nvim"
alias v="vim"

alias slf="sudo -E lf"
alias fmod="vim ~/.config/fish/config.fish"
alias bmod="vim ~/.bashrc"
alias kimod="vim ~/.config/kitty/kitty.conf"
alias kamod="vim ~/.config/kanata/kanata.kbd"
alias pmod="vim ~/.config/polybar.old/config"
alias tmod="vim ~/.tmux.conf"
alias mmod="vim ~/.config/mpd/mpd.conf"
alias ncmod="vim ~/.ncmpcpp/config"
alias cmod="vim ~/.config/conky/show_all/show_all_conf"
alias vmod="cd ~/.config/nvim ; nvim ."
alias cnv="cd ~/.config/nvim ; nvim ."

alias bsmod="cd ~/.config/bspwm ; nvim bspwmrc"

alias keymod="cd ~/.config/nvim ; nvim lua/core/keymaps.lua"

alias nmod="cd ~/.config/nvim ; nvim ."

alias amod="vim ~/.config/awesome/rc.lua"
alias imod="vim ~/.i3rc"
alias hmod="cd ~/.config/hypr ; vim hyprland.conf"
alias smod="vim ~/.config/sway/config"
alias wmod=" cd ~/.config/waybar ; vim ~/.config/waybar/"
alias irmod=" cd ~/.config/ironbar ; vim ~/.config/ironbar/"

alias pview="bat ~/.config/polybar.old/config"
alias fview="bat ~/.fishrc"
alias iview="bat ~/.i3rc"
alias tview="bat ~/.tmuxrc"
alias upmux="~/.config/tmux/tmux_github_sync.sh"
alias updmux="~/.config/tmux/tmux_github_sync.sh"
alias gitmux="~/.config/tmux/tmux_github_sync.sh"
alias cn="cd ~/.config/nvim"

alias lsblk1="lsblk -o +PARTLABEL"


alias franckfind="grep -r -l "/home/francois" ."
alias ff="grep -r -l "/home/francois" ."

alias jat="jq . |  bat --language json"

alias reload="source ~/.config/fish/config.fish"
alias r="source ~/.config/fish/config.fish"
alias cls="clear"
alias cl="clear"
alias en="echo -n"
alias theme="kitty +kitten themes"

alias updatelocate="sudo updatedb"

function package_finder
	echo "Changing shell to Bash..."
	sudo chsh -s /bin/bash

	echo "Running fpf -a..."
	fpf -a

	echo "Changing shell back to Fish..."
	sudo chsh -s /bin/fish
end
#this is a fuzzy package finder


alias findpackage="package_finder"
alias find_package="package_finder"

alias findr="sudo find / -name "
alias findi="sudo find / -lname "
#alias sudo nano="svim"
function findc
	find . -iname "*$argv*"
end



function change_permission
	echo "This will change the permission of all files of <type> to <permissions> in the current directory"
	echo "Usage: change_permission <extension> <permissions>"
	echo " 644 for regular files, 744 for scripts/executable, 600 for private files, 755 for directories "

	set -l ext (read -P "File Type: ")
	set -l perm (read -P "Permissions: ")
	set -l recursive (read -P "Recursive (y/n): ")

	if test "$recursive" = "y"
		find . -type f -name "*.$ext" -exec chmod $perm {} +
	else
		find . -maxdepth 1 -type f -name "*.$ext" -exec chmod $perm {} +
	end
end



function change_permission_recursive
	if test (count $argv) -lt 2
		echo "WARNING. THIS IS RECURSIVE"
		echo "This will change the permission of all files of <type> to <permissions> recursively from current directory"
		echo "Usage: changepermr <extension> <permissions>"
		echo " 644 for regular files, 744 for scripts/executable, 600 for private files "
		return 1
	end
	set ext $argv[1]
	set perm $argv[2]
	find . -type f -name "*.$ext" -exec chmod $perm {} +
end

function fzfv
	vim (fzf -m --preview='bat --color=always {}')
end


function fzfp
	# Get the current directory
	set image_dir (pwd)

	# Select an image using fzf with preview
	set selected_image (find $image_dir -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' | fzf --preview='feh --preload {}' --preview-window=right:50%:wrap)

	# Pipe the selected image into command 'c'
	if test -n "$selected_image"
		echo $selected_image | c
	end
end

function fzfc
	fzf -m --preview='feh {}' | c 
end

alias pythonvenv="$HOME/MainPython_Virtual_Environment/pip_venv/bin/python"
alias pv="pythonvenv"

function govenv
	source $HOME/MainPython_Virtual_Environment/pip_venv/bin/activate.fish
end

function govenv3
	source $HOME/MainPython_Virtual_Environment/pip3_venv/bin/activate.fish
end

function govenvt
	source $HOME/MainPython_Virtual_Environment/venv_test/bin/activate.fish
end
alias searchdir="rg --files | fzf"
alias sdir="searchdir"

function pvp1
	echo "Control+Shift+p Python: Select Interpreter, Enter Interpreter path"
	echo -n "$HOME/MainPython_Virtual_Environment/pip_venv/bin/python" | c 
	echo "The path of the python interpreter is now inside your clipboard. Just Control v it"
end


#alias leavevenv="deactivate"
alias lvenv="deactivate"
alias quitvenv="deactivate"



function lallvenv
	if status --is-interactive
		# Deactivate all active Conda environments
		while set -q CONDA_DEFAULT_ENV
			conda deactivate
		end

		# Deactivate Python virtual environment if active
		if set -q VIRTUAL_ENV
			deactivate
		end
	end
end


alias lallenv="lallvenv"


alias urlisten="sudo tcpdump -i wlan0 -n tcp port 80 or tcp port 443"
alias iplisten="sudo iftop"
alias inl="sudo nethogs wlan0"
alias ist="govenv ; speedtest-cli ;lvenv"
#internet network listen


#alias cd="z"
# might break stuff idk. i'll keep it for now
# alias v="z"
alias eva="eza"
alias ls="eza"
alias ll='eza -alf'
alias la='eza -a'
alias l='eza -cf'
alias lsdir='ls -d */'


#nu shell commands
alias nls="nu -c 'ls'"



alias ch='cd ~'
alias cr="cd ~/.config/rofi"
alias ce="cd ~/.config/eww"
alias cm="cd ~/Music"
alias cP="cd ~/.config/polybar.old/"
alias cw="cd ~/.config/waybar"
alias cka="cd ~/.config/kanata"
alias cki="cd ~/.config/kitty"
alias cir="cd ~/.config/ironbar"
alias cH="cd ~/.config/hypr"
alias cS="cd ~/.config/systemd"
alias cpi="cd ~/Pictures"
alias clf="cd ~/.config/lf"
alias chy="cd ~/.config/hypr"
alias cdoc="cd ~/Documents"
alias cdo="cd ~/Downloads"
alias cco="cd ~/.config"
alias ck="cd ~/.config/kanata"
alias ct="cd ~/.local/share/Trash/files"
alias ctm="cd ~/.config/tmux"
alias chg=" cd ~/home_for_git"
alias cs9="cd ~ ; cd sem9"


alias kmux="tmux kill-server"
alias lmux="tmux detach"
alias dmux="tmus detach"
alias qmux="tmux kill-session"
alias jmux="tmux kill-session"

#Because sometimes a tmux panes can't recieve input
alias kpane="tmux kill-pane"
alias rmux="tmux source-file ~/.tmux.conf"
alias umux="tmux source-file ~/.tmux.conf"
alias jj="tmux select-pane -L"
alias jk="tmux select-pane -D"
alias jl="tmux select-pane -R"
alias ji="tmux select-pane -U"




function tswap
	set -l pane1 $argv[1]
	set -l pane2 $argv[2]

	tmux swap-pane -s $pane1 -t $pane2
end




function comparehash_md5
	set file "$argv[1]"
	set expected_hash "$argv[2]"

	set actual_hash (md5sum "$file" | awk '{print $1}')

	if test "$actual_hash" = "$expected_hash"
		echo "Hashes match: $actual_hash"
	else
		echo "Hashes do not match:"
		echo "Actual hash:   $actual_hash"
		echo "Expected hash: $expected_hash"
	end
end


function comparehash_sha
	set file "$argv[1]"
	set expected_hash "$argv[2]"

	set actual_hash (sha256sum "$file" | awk '{print $1}')

	if test "$actual_hash" = "$expected_hash"
		echo "Hashes match: $actual_hash"
	else
		echo "Hashes do not match:"
		echo "Actual hash:   $actual_hash"
		echo "Expected hash: $expected_hash"
	end
end



alias sp="sudo pacman -S"
alias yp="yay -S"

# alias c="xclip -sel c"
# alias paste="xclip -selection clipboard -o"

set DISPLAY_SERVER "$XDG_SESSION_TYPE"
if test "$DISPLAY_SERVER" = "wayland"
	alias c="wl-copy"
	alias paste="wl-paste --type text/plain"
	alias p="wl-paste --type text/plain"
else if test "$DISPLAY_SERVER" = "x11"
	alias c="xclip -sel c"
	alias paste="xclip -selection clipboard -o"
	alias p="xclip -selection clipboard -o"
end


alias copy="c"
alias pwc='echo -n $(pwd) | c'
alias pwv="cd (p)"
alias p="paste"
alias prevc="history --max=1 | c"






function ndiff
	if test (count $argv) -ne 2
		echo "Usage: nrdiff file1 file2"
		return 1
	end
	diff --color $argv[1] $argv[2] | diff-so-fancy | bat
end


function bdiff
	if test (count $argv) -ne 2
		echo "Usage: ndiff file1 file2"
		return 1
	end
	git diff --no-index --color $argv[1] $argv[2] | diff-so-fancy | bat
end


zoxide init fish | source





# Change working dir in fish to last dir in lf on exit (adapted from ranger).
#
# You may put this file to a directory in $fish_function_path variable:
#
#     mkdir -p ~/.config/fish/functions
#     ln -s "/path/to/lfcd.fish" ~/.config/fish/functions
#
# You may also like to assign a key (Ctrl-O) to this command:
#
bind \cf 'set old_tty (stty -g); stty sane; lf; stty $old_tty; commandline -f repaint'
#
# You may put this in a function called fish_user_key_bindings.

# function lfcd --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
# # `command` is needed in case `lfcd` is aliased to `lf`.
# # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
# cd "$(command lf -print-last-dir $argv)"
# end

# alias lf="lfcd"

alias bless="bat --color=always --paging=always"



#to get logisim-evolution working without actually installing a package. 
alias "logism=/opt/logisim-evolution/bin/logisim-evolution"
alias "logisim=/opt/logisim-evolution/bin/logisim-evolution"

#alias "mars=java -jar \"$HOME/Documents/Linux Documents/University (real)/Semester 7/COMP 273/MARS.jar\""

#alias "MARS=java -jar \"$HOME/Documents/Linux Documents/University (real)/Semester 7/COMP 273/MARS.jar\""
alias "journal=xournalpp"
alias "xournal=xournalpp"
alias "notebook=xournalpp"
alias "paper=xournalpp"
alias "note=xournalpp"

#alias "logout=wlogout"




export PATH="$HOME:$PATH"
export PATH="$HOME/AppImages:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Documents/Linux Documents/University (real):$PATH"
export PATH="$HOME/QolScripts:$PATH"
export PATH="$HOME/WindowsFileSystem:$PATH"
export PATH="$HOME/Network:$PATH"
export PATH="$HOME/Pictures:$PATH"
export PATH="$HOME/Videos/i3-video-wallpaper-main/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="$HOME/.config/rofi/applets/bin:$PATH"
export PATH="$HOME/.config/tmux:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"

export PATH="$HOME/Music:$PATH"
export PATH="$HOME/Videos/Animated_Background/:$PATH"
export PATH="$HOME/Pictures/Slideshow_Scripts/Utils:$PATH"
export PATH="$HOME/Pictures/Slideshow_Scripts/Master:$PATH"
export PATH="$HOME/Pictures/Slideshow_Scripts/Parent:$PATH"
# export PATH="$HOME/miniconda3/bin:$PATH"




export PATH="$HOME/.config/conky:$PATH"

export PATH="$HOME/.config/polybar.old/:$PATH"
export PATH="$HOME/.config/polybar/:$PATH"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH_TO_FX="/usr/lib/jvm/javafx-sdk-17.0.13/lib"
export PATH="$JAVA_HOME/bin:$PATH"

# Set paths for JUnit 5 and JUnit 4
set -gx JUNIT5_PATH /usr/lib/jvm/junit5
set -gx JUNIT4_PATH /usr/lib/jvm/junit4

# Add JUnit paths to CLASSPATH or module path
set -gx CLASSPATH $JUNIT5_PATH/junit-jupiter-api-5.11.3.jar \
$JUNIT5_PATH/junit-jupiter-engine-5.11.3.jar \
$JUNIT5_PATH/junit-jupiter-params-5.11.3.jar \
$JUNIT4_PATH/junit-4.13.2.jar 



alias convert_folder="./update_slideshow_files"
alias update_slideshow="./update_slideshow_files"
#alias update_background="update_slideshow_files"






function fish_greeting
	clear
	# echo "Welcome to Poutine Au Sirop D'erable's config!" | figlet | lolcat
	#fortune | cowsay -f dragon
	#-o is for offensive/spicier
end



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f $HOME/miniconda3/bin/conda
#    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
#else
#    if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
#        . "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
#    else
#        set -x PATH "$HOME/miniconda3/bin" $PATH
#    end
#end
# <<< conda initialize <<<
#conda activate venv


# Function to activate Conda environments
function conda_activate
	set conda_path "$HOME/miniconda3/bin/conda"
	if test -x $conda_path
		eval $conda_path "shell.fish" "hook" $argv | source
		conda activate conda_venv
	else
		echo "Error: Conda not found at $conda_path"
	end
end


alias set_private="$HOME/.local/share/private/local/settings/set_private.sh"
alias set_public="$HOME/.local/share/private/local/settings/set_public.sh"



#govenv
#conda_activat
#if not pgrep mpd > /dev/null 
#	mpd
#end


eval (tmuxifier init - fish)
