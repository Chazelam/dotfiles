# Установка зависимостей
Fedora:
```bash
sudo dnf install 
```
Arch:
```bash
sudo pacman install 
```

# Создание семилинков
```bash
# Удалите существующие конфиги (если они есть)
rm -rf ~/.config/fastfetch ~/.config/hypr ~/.config/kitty ~/.config/waybar

# Создайте симлинки для каждой папки:
ln -s ~/dotfiles/config/fastfetch ~/.config/fastfetch
ln -s ~/dotfiles/config/hypr ~/.config/hypr
ln -s ~/dotfiles/config/kitty ~/.config/kitty
ln -s ~/dotfiles/config/waybar ~/.config/waybar

rm ~/.zshrc  # Если файл уже существует
ln -s ~/dotfiles/zshrc ~/.zshrc
```

