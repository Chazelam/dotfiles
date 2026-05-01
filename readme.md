# todo
- [x] fish
- [x] Буфер обмена
- [ ] login screen
	- [ ] Без задержки от неверного ввода (Hyprlock - параша)
	- [ ] Авто выключение экрана и уход в сон

- [ ] Поменять курсор
- [ ] Меню питания
	- [ ] Работа кнопки питания
- [ ] Кастомный fastfetch
- [ ] Офлайн календарь
---





# Установка зависимостей
## Misc:
```bash
sudo dnf install git python fish
sudo dnf install pavucontrol waybar kitty mako fuzzel fastfetch
```

git python fish pavucontrol waybar kitty mako fuzzel fastfetch


## Nerd Fonts 0xProto:
```bash
curl -L -o 0xProto.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.zip
unzip 0xProto.zip -d ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
rm 0xProto.zip
```
Проверка
```bash
fc-list : family style | grep -i nerd
```

## Starship
```bash
curl -sS https://starship.rs/install.sh | sh
```
## flatpack:
```bash
sudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.telegram.desktop
```

Hyprland:
```bash
sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprland wl-clipboard wayland-devel wayland-protocols-devel hyprlang-devel pango-devel cairo-devel file-devel libglvnd-devel libglvnd-core-devel libjpeg-turbo-devel libwebp-devel libjxl-devel gcc-c++ hyprutils-devel hyprwayland-scanner
```

[NM GUI](https://github.com/s-adi-dev/nmgui):
```bash
sudo curl -L https://github.com/s-adi-dev/nmgui/releases/download/v1.0.0/main.bin -o /usr/bin/nmgui
sudo chmod +x /usr/bin/nmgui
curl -sL https://raw.githubusercontent.com/s-adi-dev/nmgui/main/nmgui.desktop | sudo tee /usr/share/applications/nmgui.desktop > /dev/null
```

[HyprShot GUI](https://github.com/s-adi-dev/hyprshot-gui):
```bash
curl -sL https://raw.githubusercontent.com/s-adi-dev/hyprshot-gui/refs/heads/main/src/hyprshot-gui | sudo tee /usr/bin/hyprshot-gui > /dev/null
sudo chmod +x /usr/bin/hyprshot-gui
curl -sL https://raw.githubusercontent.com/s-adi-dev/hyprshot-gui/refs/heads/main/src/hyprshot.desktop | sudo tee /usr/share/applications/hyprshot.desktop > /dev/null
```

NetBird:
```bash
curl -fsSL https://pkgs.netbird.io/install.sh | sh
```
```bash
netbird up
```
```bash
netbird down
```


VS Code:
```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update
sudo dnf install code
```

# Создание семилинков
```bash
# Удалите существующие конфиги (если они есть)
rm -rf ~/.config/fastfetch ~/.config/hypr ~/.config/kitty ~/.config/waybar
rm -rf ~/.config/mako
rm -rf ~/.config/fuzzel
rm -rf ~/.config/fish


# Создайте симлинки для каждой папки:
ln -s ~/dotfiles/config/fuzzel ~/.config/fuzzel
2ln -s ~/dotfiles/config/fish ~/.config/fish
ln -s ~/dotfiles/config/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/config/hypr ~/.config/hypr
ln -s ~/dotfiles/config/kitty ~/.config/kitty
ln -s ~/dotfiles/config/waybar ~/.config/waybar


sudo ln -s ~/dotfiles/bin/cliphist /usr/local/bin/cliphist
```

# Лок частот
Просмотр информации
```bash
cpupower frequency-info
```
Необходимо поменять драйвер управленя частотой с `amd_pstate` на `acpi-cpufreq`:
```bash
sudo grubby --update-kernel=ALL --args="amd_pstate=disable"
```
И перезагрузить систему.

Далее начинает работать: 
```bash
sudo cpupower frequency-set -g powersave
```
Лочит на 1.6 Ghz

---
# Later
- [x] fuzzel
	- [ ] Убрать лишние desktop файлы
	- [x] Включить иконки ?
- [ ] Waybar
	- [x] Добавить температуру CPU
	- [x] Микшер звука
	- [ ] Виджет профилей питания
	- [ ] Виджет bluetooth
	- [x] Виджет wifi 
- [ ] Настроить VS Code / Найти замену
	- [ ] Минимизировать интерфейс
	- [ ] Заменить файловый менеджер
	- [ ] Настроить шорткаты
- [ ] Настройка браузера
	- [ ] Выбор
	- [ ] Оформление
	- [ ] Перенос закладок
	- [ ] Быстрый запуск
- [ ] Файловый менеджер
	- [ ] Выбор 
	- [ ] Настройка
	- [ ] Оформление
