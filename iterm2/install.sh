#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

set -e

source "$DOTFILES_ROOT/utils.sh"

add_iterm_preference() {
  /usr/libexec/PlistBuddy -c "add $1 $2 $3" ~/Library/Preferences/com.googlecode.iTerm2.plist
}

set_iterm_preference() {
  /usr/libexec/PlistBuddy -c "set $1 $2" ~/Library/Preferences/com.googlecode.iTerm2.plist
}

upsert_iterm_preference() {
  set +e
  set_iterm_preference "$1" "$3" || add_iterm_preference "$1" "$2" "$3"
  set -e
}


open_confirm_close_iterm() {
  # Open the app so the preference files get initialized
  open -g "/Applications/iTerm.app" && sleep 2

  info "Please click through any iTerm popups and close iTerm before continuing"
  validation_prompt
}

brew cask install iterm2
success "Installed iterm2"

rm ~/Library/Preferences/com.googlecode.iterm2.plist || true
killall cfprefsd
success "Deleted old config"

open_confirm_close_iterm

# Set reasonable defaults for stuff
upsert_iterm_preference "'AllowClipboardAccess'" "bool" "true"
upsert_iterm_preference "'JobName'" "bool" "true" 
upsert_iterm_preference "'NoSyncCommandHistoryHasEverBeenUsed'" "bool" "true"
upsert_iterm_preference "'OpenTmuxWindowsIn'" "integer" "0"
upsert_iterm_preference "'SUEnableAutomaticChecks'" "bool" "true"
upsert_iterm_preference "'SUSendProfileInfo'" "bool" "false"
upsert_iterm_preference "'ShowBookmarkName'" "bool" "false"
upsert_iterm_preference "'ShowPaneTitles'" "bool" "true"
upsert_iterm_preference "'StretchTabsToFillBar'" "bool" "false"
upsert_iterm_preference "'TabStyleWithAutomaticOption'" "integer" "0"
upsert_iterm_preference "'TabViewType'" "integer" "0"
upsert_iterm_preference "'WindowNumber'" "bool" "true"
upsert_iterm_preference "'WordCharacters'" "string" "'/-+\~_.'"
success "Setting reasonable defaults"

# Default shell
upsert_iterm_preference "'New Bookmarks':0:'Custom Command'" "string" "'Yes'"
upsert_iterm_preference "'New Bookmarks':0:'Command'" "string" "'/bin/zsh'"
success "Setting default shell"

# Setup window width
upsert_iterm_preference "'New Bookmarks':0:'Columns'" "integer" "160"
upsert_iterm_preference "'New Bookmarks':0:'Rows'" "integer" "50"
success "Setting default window size"

# Set font
upsert_iterm_preference "'New Bookmarks':0:'Normal Font'" "string" "'DejaVuSansMonoPowerline 13'"
upsert_iterm_preference "'New Bookmarks':0:'Non Ascii Font'" "string" "'DejaVuSansMonoPowerline 13'"
upsert_iterm_preference "'New Bookmarks':0:'Use Non-ASCII Font'" "bool" "true"
upsert_iterm_preference "'New Bookmarks':0:'Use Bright Bold'" "bool" "false"
success "Setting font"

# Unlimited Scrollback
upsert_iterm_preference "'New Bookmarks':0:'Unlimited Scrollback'" "bool" "true"
success "Setting unlimited scrollback"

# Mute bell
upsert_iterm_preference "'New Bookmarks':0:'Silence Bell'" "bool" "true"
success "Muting bell"

# Apply Solarized Theme in default profile
COLOR_NAMES=(\
  "Ansi 0 Color" \
  "Ansi 1 Color" \
  "Ansi 10 Color" \
  "Ansi 11 Color" \
  "Ansi 12 Color" \
  "Ansi 13 Color" \
  "Ansi 14 Color" \
  "Ansi 15 Color" \
  "Ansi 2 Color" \
  "Ansi 3 Color" \
  "Ansi 4 Color" \
  "Ansi 5 Color" \
  "Ansi 6 Color" \
  "Ansi 7 Color" \
  "Ansi 8 Color" \
  "Ansi 9 Color" \
  "Background Color" \
  "Bold Color" \
  "Cursor Color" \
  "Cursor Text Color" \
  "Foreground Color" \
  "Selected Text Color" \
  "Selection Color" \
)
COLOR_DEFS=(\
  "0.25882352941176473;0.21176470588235294;0.027450980392156862" \
  "0.18431372549019609;0.19607843137254902;0.86274509803921573" \
  "0.45882352941176469;0.43137254901960786;0.34509803921568627" \
  "0.51372549019607838;0.4823529411764706;0.396078431372549" \
  "0.58823529411764708;0.58039215686274515;0.51372549019607838" \
  "0.7686274509803922;0.44313725490196076;0.42352941176470588" \
  "0.63137254901960782;0.63137254901960782;0.57647058823529407" \
  "0.8901960784313725;0.96470588235294119;0.99215686274509807" \
  "0.0;0.59999999999999998;0.52156862745098043" \
  "0.0;0.53725490196078429;0.70980392156862748" \
  "0.82352941176470584;0.54509803921568623;0.14901960784313725" \
  "0.50980392156862742;0.21176470588235294;0.82745098039215681" \
  "0.59607843137254901;0.63137254901960782;0.16470588235294117" \
  "0.83529411764705885;0.90980392156862744;0.93333333333333335" \
  "0.21176470588235294;0.16862745098039217;0.0" \
  "0.086274509803921567;0.29411764705882354;0.79607843137254897" \
  "0.21176470588235294;0.16862745098039217;0.0" \
  "0.63137254901960782;0.63137254901960782;0.57647058823529407" \
  "0.58823529411764708;0.58039215686274515;0.51372549019607838" \
  "0.25882352941176473;0.21176470588235294;0.027450980392156862" \
  "0.58823529411764708;0.58039215686274515;0.51372549019607838" \
  "0.63137254901960782;0.63137254901960782;0.57647058823529407" \
  "0.25882352941176473;0.21176470588235294;0.027450980392156862" \
)

for color_idx in "${!COLOR_NAMES[@]}"; do
  color="${COLOR_NAMES[$color_idx]}"
  color_def=(${COLOR_DEFS[$color_idx]//;/ })
  blue="${color_def[0]}"
  green="${color_def[1]}"
  red="${color_def[2]}"
  #/usr/libexec/PlistBuddy -c "delete :'New Bookmarks':0:'$color'" ~/Library/Preferences/com.googlecode.iterm2.plist
  #add_iterm_preference "'New Bookmarks':0:'$color'" "dict"
  upsert_iterm_preference "'New Bookmarks':0:'$color':'Color Space'" "string" "sRGB"
  upsert_iterm_preference "'New Bookmarks':0:'$color':'Blue Component'" "real" "$blue"
  upsert_iterm_preference "'New Bookmarks':0:'$color':'Green Component'" "real" "$green"
  upsert_iterm_preference "'New Bookmarks':0:'$color':'Red Component'" "real" "$red"
done
success "Setting theme to solarized dark"

# Add shortcut to Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
killall Dock
success "Adding shortcut to dock"

# reset the preferences cache
killall cfprefsd

