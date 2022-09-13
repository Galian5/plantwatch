# README

PlantWatch: Aplikacja umożliwiająca monitorowanie warunków rozwoju roślin

Projekt mający na celu stworzenie aplikacji webowej umożliwiającej komunikacje z urządzeniami pomiarowymi, monitorowania, przechowywania i analizy pobranych danych.

Instrukcja instalacji:

Aplikacja korzysta z dockera, ktorego proces instalacji różni się w zależnosci od systemu operacyjnego.
Skorzystaj ze strony https://www.docker.com/ i wybierz opcje odpowiadająca Twojemu systemowi.

Korzystajac z konsoli w katalogu, gdzie znajduje się aplikacja Plantwatch, użyj następujace komendy:
- docker compose build
- docker compoose up
- docker compose run web rake db:create

Aplikacja bedzie dostępna pod adresem http://localhost:3000/

