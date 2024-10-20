#!/bin/sh

# Homebrew kurulumu için hedef dizin (kullanıcının dizinine göre dinamik)
HOMEBREW_DIR="$HOME/homebrew"

# Homebrew dizinini oluştur
mkdir -p "$HOMEBREW_DIR"

# Homebrew'u indir ve kur
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C "$HOMEBREW_DIR"

# Homebrew'u çalıştırabilmek için PATH ayarları
eval "$($HOMEBREW_DIR/bin/brew shellenv)"

# Homebrew'u güncelle
brew update --force --quiet

# Zsh için izinleri güncelle
chmod -R go-w "$(brew --prefix)/share/zsh"

# PATH değişkenini zsh konfigürasyon dosyalarına dinamik olarak ekle
echo "export PATH=\"$HOMEBREW_DIR/bin:\$PATH\"" >> ~/.zshrc
source ~/.zshrc

# Curl'ü indir ve kur
brew install curl
