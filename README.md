# Rezerwacja-kortow-baza-danych
Dokumentacja użytkowa bazy danych systemu rezerwacji kortów tenisowych
Spis treści
1.	Opis struktury bazy danych
2.	Widoki w bazie danych
3.	Procedury
4.	Triggery
5.	Przykłady użycia
________________________________________
1. Opis struktury bazy danych
Baza danych systemu rezerwacji kortów tenisowych składa się z następujących tabel:
Tabele główne:
•	uzytkownicy: Przechowuje informacje o użytkownikach systemu.
o	Klucz główny: id_uzytkownika
o	Pola: imie, nazwisko, email, numer_telefonu, data_rejestracji
•	korty: Zawiera dane o kortach sportowych.
o	Klucz główny: id_kortu
o	Pola: nazwa_kortu, lokalizacja, typ_nawierzchni, status, godzina_otwarcia, godzina_zamkniecia
•	rezerwacje: Przechowuje informacje o rezerwacjach kortów.
o	Klucz główny: id_rezerwacji
o	Pola: id_uzytkownika, id_kortu, data_rezerwacji, godzina_start, godzina_koniec, status
•	platnosci: Rejestruje płatności związane z rezerwacjami.
o	Klucz główny: id_platnosci
o	Pola: id_rezerwacji, kwota, status, data_platnosci
•	cennik: Zawiera informacje o kosztach rezerwacji w zależności od typu kortu i czasu wynajmu.
o	Klucz główny: id_cennika
o	Pola: id_kortu ,cena_za_godzine.

________________________________________
2. Widoki w bazie danych
Widoki zostały utworzone w celu ułatwienia dostępu do najczęściej wykorzystywanych danych:
2.1. szczegoly_rezerwacji
Wyświetla szczegóły dotyczące każdej rezerwacji, łącząc informacje z tabel uzytkownicy, korty, oraz rezerwacje.
•	Pola: id_rezerwacji, imie, nazwisko, email, nazwa_kortu, data_rezerwacji, godzina_rezerwacji, status
•	Przykład użycia: select * from szczegoly_rezerwacji;
2.2. statystyki_wykorzystania_obiektow
Zapewnia informacje statystyczne na temat liczby rezerwacji na poszczególnych kortach.
•	Pola: id_kortu, nazwa_kortu, lokalizacja, liczba_rezerwacji
•	Przykład użycia:  select * from statystyki_wykorzystania_obiektow;
2.3. rezerwacje_z_platnościami
Łączy dane z tabel rezerwacje i platnosci, prezentując informacje o rezerwacjach, które zostały opłacone.
•	Pola: id_rezerwacji, id_uzytkownika, id_kortu, data_rezerwacji, status_rezerwacji, kwota, status_platnosci
•	Przykład użycia: select * from rezerwacje_z_płatnościami;
________________________________________
3. Procedury składowane
Procedury zostały zaprojektowane do obsługi najważniejszych operacji w systemie:
3.1. dodaj_rezerwacje
Dodaje nową rezerwację dla użytkownika.
•	Parametry: id_uzytkownika, id_kortu, data_rezerwacji, godzina_rezerwacji
•	Przykład użycia: 
 
CALL dodaj_rezerwacje(
	1,               -- ID użytkownika
    	1,               -- ID kortu    
    '10:00:00',      -- Godzina rozpoczęcia
    '12:00:00' ,      -- Godzina zakończenia
'2024-12-26'    -- Data rezerwacji (dzień)
);
3.2. sprawdz_dostepnosc_kortow
Sprawdza dostępność kortów w podanym terminie.
•	Parametry: data_rezerwacji, godzina_rezerwacji
•	Przykład użycia:  
CALL sprawdz_dostepnosc_kortow('2024-12-25',  '10:00' , '12:00');
3.3. usun_rezerwacje
Usuwa rezerwację o podanym identyfikatorze.
•	Parametry: id_rezerwacji
•	Przykład użycia: CALL usun_rezerwacje(10);
3.4. oplac_platnosc
Aktualizuje status płatności na "opłacona" oraz zmienia status rezerwacji na "zarezerwowana".
Parametry:
•	platnosc_id (INT): Identyfikator płatności, którą chcemy oznaczyć jako opłaconą.
•	Przykład użycia:   CALL oplac_platnosc(1);
Szczegóły działania:
1.	Pobranie danych płatności: Procedura odczytuje bieżący status płatności i przypisaną do niej rezerwację.
2.	Sprawdzenie statusu płatności: Jeśli status płatności to "oczekująca", procedura przechodzi do aktualizacji; w przeciwnym razie zgłasza błąd.
3.	Aktualizacja płatności: Zmienia status płatności na "opłacona" i ustawia bieżącą datę jako datę płatności.
4.	Aktualizacja rezerwacji: Zmienia status rezerwacji powiązanej z płatnością na "zarezerwowana".
5.	Obsługa błędów: Jeśli płatność ma już status "opłacona" lub "anulowana", procedura zgłasza błąd i nie wykonuje żadnych zmian.
Przykład zastosowania:
•	Rezerwacja o ID 1 ma przypisaną płatność o ID 1 ze statusem "oczekująca".
•	Po wywołaniu CALL oplac_platnosc(1); :
o	Status płatności zmieni się na "opłacona".
o	Status rezerwacji zmieni się na "zarezerwowana".
•	Jeśli płatność o ID 1 jest już opłacona, zostanie zgłoszony błąd:
"Płatność już została opłacona lub anulowana."

________________________________________
4. Triggery
4.1 Trigger: before_insert_uzytkownicy
•	Typ: BEFORE INSERT
•	Cel:
Automatyczne uzupełnianie pola data_rejestracji w tabeli uzytkownicy, jeśli podczas wstawiania nowego rekordu wartość ta nie została podana.
•	Opis działania:
1.	Gdy użytkownik wprowadza nowy rekord do tabeli uzytkownicy, trigger sprawdza, czy pole data_rejestracji ma przypisaną wartość.
2.	Jeśli pole jest puste (NULL), trigger automatycznie ustawia bieżącą datę (CURDATE()) jako wartość tego pola.
•	Użycie:
o	Użytkownik nie musi ręcznie wypełniać pola data_rejestracji, ponieważ trigger automatycznie wprowadzi odpowiednią wartość.
o	W przypadku, gdy data została podana, trigger nie podejmuje żadnych działań.
•	Przykład: Zapytanie wstawiające rekord:
INSERT INTO uzytkownicy (imie, nazwisko,email,telefon) VALUES ('Fabian', 'Drwalczyk','fabian@gmail.com','123456789');  
4.2 Trigger: sprawdz_godziny_otwarcia
•	Typ: BEFORE INSERT
•	Cel: Weryfikacja, czy godziny rezerwacji kortu mieszczą się w jego godzinach otwarcia i zamknięcia, w celu zapobieżenia błędnym zapisom w tabeli rezerwacje.
•	Opis działania:
1.	Przy każdej próbie wstawienia nowego rekordu do tabeli rezerwacje trigger pobiera godziny otwarcia (godzina_otwarcia) i zamknięcia (godzina_zamkniecia) kortu na podstawie jego identyfikatora (id_kortu).
2.	Następnie sprawdza, czy godzina rozpoczęcia rezerwacji (godzina_start) i godzina jej zakończenia (godzina_koniec) mieszczą się w tych godzinach.
3.	Jeśli godziny rezerwacji wykraczają poza zakres, trigger zgłasza błąd i przerywa operację wstawienia.
Komunikat błędu:
"Rezerwacja jest poza godzinami otwarcia dla tego kortu."
•	Użycie:
o	Przed wstawieniem rekordu do tabeli rezerwacje użytkownik musi upewnić się, że godziny rezerwacji są zgodne z godzinami pracy kortu.
o	Jeśli operacja zostanie przerwana, komunikat błędu wyjaśni przyczynę problemu.
•	Przykład błędnej rezerwacji:
Zapytanie:
INSERT INTO rezerwacje (id_kortu, godzina_start, godzina_koniec) 
VALUES (1, '18:00:00', '20:00:00');
Efekt:
Trigger przerwie operację, jeśli godziny otwarcia kortu to 08:00:00 - 16:00:00.
Komunikat błędu:
"Rezerwacja jest poza godzinami otwarcia dla tego kortu."




________________________________________
5. Przykłady użycia
5.1. Tworzenie nowego użytkownika
INSERT INTO uzytkownicy (imie, nazwisko, email, telefon)
VALUES ('Wojciech', 'Barnas', 'ojwojtek@example.com', '123456789');
5.2. Rezerwacja kortu
CALL dodaj_rezerwacje(1, 4, '2024-12-26', '14:00');
5.3. Sprawdzenie dostępności kortów
CALL sprawdz_dostepnosc_kortow('2024-12-26', '12:00' , '14:00' );
5.4. Usunięcie rezerwacji
CALL usun_rezerwacje(3);
5.5. Opłacenie płatności 
CALL oplac_platnosc(3);


7.	Diagram ERD bazy danych
   ![image](https://github.com/user-attachments/assets/a690eb98-302b-468b-b2e3-040b7123db7f)

 



