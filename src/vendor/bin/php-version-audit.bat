@ECHO OFF
setlocal DISABLEDELAYEDEXPANSION
SET BIN_TARGET=%~dp0/../lightswitch05/php-version-audit/php-version-audit
php "%BIN_TARGET%" %*
