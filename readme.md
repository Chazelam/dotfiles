# todo
- [ ] Добавление поддержки второго монитора(Не каловая(Красоту навести))
- [ ] Waybar
	- [ ] Добавить температуру CPU
	- [ ] Микшер звука
	- [ ] Виджет профилей питания
	- [ ] Виджет bluetooth
	- [ ] Виджет wifi 
	- [ ] Виджет Календаря ?

>https://www.reddit.com/r/hyprland/comments/1dc2ux2/i_want_to_start_creating_my_own_guis_for_custom/
- [ ] Rofi
	- [ ] Попутно настроить иконки
- [ ] Меню питания
	- [ ] Работа кнопки питания
- [ ] Кастомный fastfetch
- [ ] Подробно расписать и продумать рабочие столы
- [ ] Подробно расписать и продумать шорткаты
- [ ] Настройка браузера
	- [ ] Выбор
	- [ ] Оформление
	- [ ] Перенос закладок
	- [ ] Быстрый запуск
- [ ] Файловый менеджер
	- [ ] Выбор 
	- [ ] Настройка
	- [ ] Оформление
- [ ] Попробовать fish

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

