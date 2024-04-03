@echo off
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0TF2_Multiplayer_Fix.ps1""' -Verb RunAs}"
