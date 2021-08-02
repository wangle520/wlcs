@ECHO OFF
setlocal DISABLEDELAYEDEXPANSION
SET BIN_TARGET=%~dp0/../psecio/versionscan/bin/versionscan
php "%BIN_TARGET%" %*
