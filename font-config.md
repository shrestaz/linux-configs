# Set default fonts with emojis and fonts aliases on Linux (with Apple's San Francisco font)

1. Open `~/.config/fontconfig/fonts.conf`

2. Overwrite existing content with the following block.

(This is based on Apple's San Francisco and Noto Emoji font. On Arch Linux, install with the command `yay -S otf-san-francisco` & `pacman -S noto-fonts-emoji`)

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
 <!-- Set preferred serif, sans serif, and monospace fonts. -->
 <alias>
  <family>serif</family>
  <prefer>
   <family>Noto Color Emoji</family>
  </prefer>
 </alias>
 <alias>
  <family>sans-serif</family>
  <prefer>
   <family>Noto Color Emoji</family>
  </prefer>
 </alias>
 <alias>
  <family>sans</family>
  <prefer>
   <family>Noto Color Emoji</family>
  </prefer>
 </alias>
 <alias>
  <family>monospace</family>
  <prefer>
   <family>Noto Color Emoji</family>
  </prefer>
 </alias>
 <!-- Aliases for commonly used MS fonts. -->
 <match>
  <test name="family">
   <string>Arial</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Helvetica</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Verdana</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Tahoma</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <!-- Insert joke here -->
  <test name="family">
   <string>Comic Sans MS</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Times New Roman</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Times</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>SF Pro Text</string>
  </edit>
 </match>
 <match>
  <test name="family">
   <string>Courier New</string>
  </test>
  <edit name="family" binding="strong" mode="assign">
   <string>NotoMono Nerd Font</string>
  </edit>
 </match>
 <dir>~/.fonts</dir>
</fontconfig>

```

----
Based on [this repository](https://jichu4n.com/posts/how-to-set-default-fonts-and-font-aliases-on-linux/). Thanks🏆🙏