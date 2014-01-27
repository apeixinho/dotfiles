#!/bin/sh

mkdir /rsync_clone
mount /dev/sda3 /rsync_clone
START=$(date +%s)

rsync -aAXv /* /rsync_clone --exclude=rsync_clone \
    --exclude=hdd500 \
    --exclude=var/lib/pacman/sync/* \
    --exclude=var/log/journal/* \
    --exclude=home/*/.thumbnails/* \
    --exclude=home/*/.mozilla/firefox/*.default/Cache/* \
    --exclude=home/*/.cache/chromium/* \
    --exclude=home/andrei/Downloads \
    --exclude=home/andrei/VirtualBox* \
    --exclude=dev/* \
    --exclude=proc/* \
    --exclude=sys/* \
    --exclude=tmp/* \
    --exclude=run/* \
    --exclude=mnt/* \
    --exclude=media/* \
    --exclude=lost+found

# rsync -aAXv /* /rsync_clone --exclude-from='/tmp/rsynch_ignore.txt'
FINISH=$(date +%s)
rm -rf /tmp/rsynch_ignore.tx
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" | tee $1/"Backup from $(date '+%A, %d %B %Y, %T')"

cp /rsync_clone/etc/fstab.chrooted /rsync_clone/etc/fstab

