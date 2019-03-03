# Set default fonts with emojis and fonts aliases on Linux

1. Open `~/.config/fontconfig/fonts.conf`

2. Overwrite existing content with the following block.

(This is based on ChromeOS and Noto Emoji font. On Arch Linux, install with the command `yay -S ttf-croscore` & `pacman -S noto-fonts-emoji`)

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
  <!-- Set preferred serif, sans serif, and monospace fonts. -->
  <alias>
    <family>serif</family>
    <prefer><family>Noto Color Emoji</family></prefer>
  </alias>
  <alias>
    <family>sans-serif</family>
    <prefer><family>Noto Color Emoji</family></prefer>
  </alias>
  <alias>
    <family>sans</family>
    <prefer><family>Noto Color Emoji</family></prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer><family>Noto Color Emoji</family></prefer>
  </alias>
  <!-- Aliases for commonly used MS fonts. -->
  <match>
    <test name="family"><string>Arial</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Helvetica</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Verdana</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Tahoma</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <!-- Insert joke here -->
    <test name="family"><string>Comic Sans MS</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times New Roman</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Tinos</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Tinos</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Courier New</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Cousine</string>
    </edit>
  </match>
</fontconfig>

```

----
Based on [this repository](https://jichu4n.com/posts/how-to-set-default-fonts-and-font-aliases-on-linux/). Thanks🏆🙏