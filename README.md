# README

PlantWatch: Aplikacja umożliwiająca monitorowanie warunków rozwoju roślin

Projekt mający na celu stworzenie aplikacji webowej umożliwiającej komunikacje z urządzeniami pomiarowymi, monitorowania, przechowywania i analizy pobranych danych.

Instrukcja instalacji:

Aplikacja korzysta z dockera, ktorego proces instalacji różni się w zależnosci od systemu operacyjnego.
Skorzystaj ze strony https://www.docker.com/ i wybierz opcje odpowiadająca Twojemu systemowi.

Korzystajac z konsoli w katalogu, gdzie znajduje się aplikacja Plantwatch, użyj następujace komendy:
- docker compose build
- docker compoose up
- docker compose run web rake db:setup

Aplikacja bedzie dostępna pod adresem http://localhost:3000/

W celu uruchomienia konsoli rails bedac w katalogu uzyj nastepujacej komendy: docker-compose run web rails console

Instrukcja obsługi:
- konieczne jest założenie konta w celu korzystania z aplikacji
- aby dodawac monitorowane rosliny wpierw nalezy dodac urzadzenie pomiarowe w zakladce devices
- nowe rosliny mozna dodawac z panelu strony glownej. W tym samym miejscu znajduje sie panel zarządzania nimi
- parametry dla danej rosliny ustawia się klikajac przycisk Plant Settings, a nastepnie uzupelniajac wybrane przez siebie pola. Kazdy z parametrow jest opcjonalny.
- harmonogram podlewania ustawia się klikajac przycisk Watering schedule i uzupelniajac formularz
- informacje na temat pomiarow mozna znalezc klikajac przycisk measurements
