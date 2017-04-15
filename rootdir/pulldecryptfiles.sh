#!/sbin/sh

mkdir -p /system
mount -t ext4 -o ro /dev/block/bootdevice/by-name/system /system

cp /system/lib64/hw/keystore.msm8994.so /sbin/keystore.msm8994.so

cp /system/lib/libkeymaster1.so /sbin/libkeymaster1.so.32
cp /system/lib64/libkeymaster1.so /sbin/libkeymaster1.so
cp /system/lib/libkeymaster_messages.so /sbin/libkeymaster_messages.so.32
cp /system/lib64/libkeymaster_messages.so /sbin/libkeymaster_messages.so
cp /system/lib/libkeystore_binder.so /sbin/libkeystore_binder.so.32
cp /system/lib64/libkeystore_binder.so /sbin/libkeystore_binder.so
cp /system/lib/libkeystore-engine.so /sbin/libkeystore-engine.so.32
cp /system/lib64/libkeystore-engine.so /sbin/libkeystore-engine.so

cp /system/vendor/lib64/lib-sec-disp.so /sbin/lib-sec-disp.so
cp /system/vendor/lib64/libGPreqcancel.so /sbin/libGPreqcancel.so
cp /system/vendor/lib64/libGPreqcancel_svc.so /sbin/libGPreqcancel_svc.so
cp /system/vendor/lib64/libQSEEComAPI.so /sbin/libQSEEComAPI.so
cp /system/vendor/lib64/libStDrvInt.so /sbin/libStDrvInt.so
cp /system/vendor/lib64/libdiag.so /sbin/libdiag.so
cp /system/vendor/lib64/libdrmfs.so /sbin/libdrmfs.so
cp /system/vendor/lib64/libdrmtime.so /sbin/libdrmtime.so
cp /system/vendor/lib64/libqisl.so /sbin/libqisl.so
cp /system/vendor/lib64/librpmb.so /sbin/librpmb.so
cp /system/vendor/lib64/libsecureui.so /sbin/libsecureui.so
cp /system/vendor/lib64/libsecureui_svcsock.so /sbin/libsecureui_svcsock.so
cp /system/vendor/lib64/libssd.so /sbin/libssd.so
cp /system/vendor/lib64/libtime_genoff.so /sbin/libtime_genoff.so

cp /system/vendor/bin/qseecomd /sbin/qseecomd
chmod 755 /sbin/qseecomd

umount /system

rm -rf /vendor
mkdir -p /vendor/lib64/hw

cp /sbin/keystore.msm8994.so /vendor/lib64/hw/keystore.msm8994.so

cp /sbin/lib-sec-disp.so /vendor/lib64/lib-sec-disp.so
cp /sbin/libGPreqcancel.so /vendor/lib64/libGPreqcancel.so
cp /sbin/libGPreqcancel_svc.so /vendor/lib64/libGPreqcancel_svc.so
cp /sbin/libQSEEComAPI.so /vendor/lib64/libQSEEComAPI.so
cp /sbin/libStDrvInt.so /vendor/lib64/libStDrvInt.so
cp /sbin/libdiag.so /vendor/lib64/libdiag.so
cp /sbin/libdrmfs.so /vendor/lib64/libdrmfs.so
cp /sbin/libdrmtime.so /vendor/lib64/libdrmtime.so
cp /sbin/libqisl.so /vendor/lib64/libqisl.so
cp /sbin/librpmb.so /vendor/lib64/librpmb.so
cp /sbin/libsecureui.so /vendor/lib64/libsecureui.so
cp /sbin/libsecureui_svcsock.so /vendor/lib64/libsecureui_svcsock.so
cp /sbin/libssd.so /vendor/lib64/libssd.so
cp /sbin/libtime_genoff.so /vendor/lib64/libtime_genoff.so

mkdir -p /system/lib
mkdir -p /system/lib64

mv /sbin/libkeymaster1.so.32 /system/lib/libkeymaster1.so
cp /sbin/libkeymaster1.so /system/lib64/libkeymaster1.so

mv /sbin/libkeymaster_messages.so.32 /system/lib/libkeymaster_messages.so
cp /sbin/libkeymaster_messages.so /system/lib64/libkeymaster_messages.so

mv /sbin/libkeystore_binder.so.32 /system/lib/libkeystore_binder.so
cp /sbin/libkeystore_binder.so /system/lib64/libkeystore_binder.so

mv /sbin/libkeystore-engine.so.32 /system/lib/libkeystore-engine.so
cp /sbin/libkeystore-engine.so /system/lib64/libkeystore-engine.so
