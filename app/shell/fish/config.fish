set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/bin
set -gx ASDF_DIR $HOME/.local/share/asdf-vm
set fish_greeting
abbr -a md mkdir -p
if test -d $ASDF_DIR
	source $ASDF_DIR/asdf.fish
	if not test -f $__fish_config_dir/completions/asdf.fish
		ln -s $ASDF_DIR/completions/asdf.fish $__fish_config_dir/completions/asdf.fish
	end
else
	echo "OwO: Cloning asdf and respawning fish!"
	git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
	exec fish
end

if status is-interactive
  abbr -a gcm 'git commit -m'
  abbr -a gp  'git push'
  abbr -a gall 'git add -A'
  abbr -a pac 'sudo pacman'
end

# pnpm
set -gx PNPM_HOME "/home/mily/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
