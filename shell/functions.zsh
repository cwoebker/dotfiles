# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tbz2) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function compresspdf {
    echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# Interactive rename. Single-arg only — prompts to edit the filename inline.
# Useful for changing a few letters in a long name.
# Usage: imv oldfilename
function imv() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    echo "Usage: imv <existing-file>" >&2
    return 1
  fi

  read -ei "$1" newfilename
  command mv -v -- "$1" "$newfilename"
}

# Opens file in EDITOR.
function edit() {
  local dir=$1
  [[ -z "$dir" ]] && dir='.'
  $EDITOR $dir
}
alias e=edit

# $ aes-enc file.zip
function aes-enc() {
  openssl enc -aes-256-cbc -e -in $1 -out "$1.aes"
}

# $ aes-dec file.zip.aes
function aes-dec() {
  openssl enc -aes-256-cbc -d -in $1 -out "${1%.*}"
}

# Converts a.mkv to a.m4v.
function mkv2mp4() {
  for file in "$@"; do
    ffmpeg -i $file -map 0 -c copy "${file%.*}.m4v"
  done
}

function mkv2mp4_1() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:1 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_2() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:2 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_3() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:3 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function jpgs2mp4() {
  ffmpeg -pattern_type glob -i "*.JPG" -c:v libx264 -pix_fmt yuv420p output.mp4
}

function slowdown_mp4() { # 1/40 right now
  for file in "$@"; do
    ffmpeg -i $file -filter:v "setpts=0.025*PTS" -an "slowdown_${file}"
  done
}

# Adds subs from a.srt to a.m4v.
function addsubs() {
  for file in "$@"; do
    local raw="${file%.*}"
    local old="$raw.m4v"
    local new="$raw-sub.m4v"
    ffmpeg -i $old -i $file -map 0 -map 1 -c copy -c:s mov_text $new
    mv $new $old
    rm $file
  done
}

# Open curr dir in preview.app.
function preview() {
  local item=$1
  [[ -z "$item" ]] && item='.'
  open $1 -a 'Preview'
}
