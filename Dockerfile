FROM archlinux:base-devel

# update base image and install dependencies
RUN pacman -Syu --noconfirm
RUN pacman -Sy  --noconfirm git just

# setup makepkg user (used for running makpkg)
RUN useradd -m makepkg && echo "makepkg ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/makepkg

USER makepkg
WORKDIR /home/makepkg

# setup gpg (used for checking package signatures)
RUN mkdir .gnupg && \
    touch .gnupg/gpg.conf && \
    echo "keyserver-options auto-key-retrieve" > .gnupg/gpg.conf

WORKDIR /pkg
CMD ["/usr/bin/makepkg"]
