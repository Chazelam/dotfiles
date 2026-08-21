# Dotfiles

Конфигурация рабочего окружения для CachyOS / Arch Linux + Hyprland.

# TODO

Misc

- [ ] Login screen
  - [ ] Убрать задержку при неверном вводе
  - [ ] Автоматическое выключение экрана и переход в сон
- [ ] Поменять курсор
- [ ] Офлайн-календарь

Waybar

- [x] Температура CPU
- [x] Микшер звука
- [x] Wi-Fi
- [ ] Профиль питания
- [ ] Меню питания
  - [ ] Настроить кнопку питания
- [ ] Bluetooth
- [ ] AmneziaVPN


# Установка

## Зависимости

```bash
sudo pacman -S git python fish \
    pavucontrol waybar kitty mako fuzzel fastfetch \
    wl-clipboard brightnessctl
```

## Hyprland

```bash
sudo pacman -S hyprland xdg-desktop-portal-hyprland
```

Polkit agent:

```bash
sudo pacman -S polkit-kde-agent
```

## Nerd Font 0xProto

```bash
curl -L -o 0xProto.zip \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip

unzip 0xProto.zip -d ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
rm 0xProto.zip
```

Проверка:

```bash
fc-list : family style | grep -i nerd
```

## Flatpak

```bash
sudo pacman -S flatpak

flatpak remote-add --if-not-exists flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo
```

Приложения:

```bash
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.telegram.desktop
```

## NetworkManager GUI

[nmgui](https://github.com/s-adi-dev/nmgui):

```bash
sudo curl -L \
    https://github.com/s-adi-dev/nmgui/releases/download/v1.0.0/main.bin \
    -o /usr/bin/nmgui

sudo chmod +x /usr/bin/nmgui

curl -sL \
    https://raw.githubusercontent.com/s-adi-dev/nmgui/main/nmgui.desktop \
    | sudo tee /usr/share/applications/nmgui.desktop > /dev/null
```

## HyprShot GUI

[hyprshot-gui](https://github.com/s-adi-dev/hyprshot-gui):

```bash
curl -sL \
    https://raw.githubusercontent.com/s-adi-dev/hyprshot-gui/refs/heads/main/src/hyprshot-gui \
    | sudo tee /usr/bin/hyprshot-gui > /dev/null

sudo chmod +x /usr/bin/hyprshot-gui

curl -sL \
    https://raw.githubusercontent.com/s-adi-dev/hyprshot-gui/refs/heads/main/src/hyprshot.desktop \
    | sudo tee /usr/share/applications/hyprshot.desktop > /dev/null
```


# Создание симлинков

Удалить существующие конфигурации:

```bash
rm -rf ~/.config/fastfetch
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/waybar
rm -rf ~/.config/mako
rm -rf ~/.config/fuzzel
rm -rf ~/.config/fish
```

Создать симлинки:

```bash
ln -s ~/dotfiles/config/fuzzel ~/.config/fuzzel
ln -s ~/dotfiles/config/fish ~/.config/fish
ln -s ~/dotfiles/config/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/config/hypr ~/.config/hypr
ln -s ~/dotfiles/config/kitty ~/.config/kitty
ln -s ~/dotfiles/config/waybar ~/.config/waybar
ln -s ~/dotfiles/config/mako ~/.config/mako
```

cliphist:

```bash
sudo ln -s ~/dotfiles/bin/cliphist /usr/local/bin/cliphist
```

# Управление частотой CPU

Просмотр текущего состояния:

```bash
cpupower frequency-info
```

Необходимо поменять драйвер управленя частотой с amd_pstate на acpi-cpufreq:
```bash
sudo grubby --update-kernel=ALL --args="amd_pstate=disable"
```
После изменения параметров необходимо перезагрузить систему.

Управление governor:

```bash
sudo cpupower frequency-set -g powersave
```
