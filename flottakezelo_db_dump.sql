-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Ápr 15. 13:14
-- Kiszolgáló verziója: 8.4.5
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `flottakezelo_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int NOT NULL,
  `license_number` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_date` date NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `driver_assignment`
--

CREATE TABLE `driver_assignment` (
  `assignment_id` int NOT NULL,
  `assigned_from` date NOT NULL,
  `assigned_to` date NOT NULL,
  `vehicle_id` int NOT NULL,
  `driver_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fuelings`
--

CREATE TABLE `fuelings` (
  `fueling_id` int NOT NULL,
  `date` date NOT NULL,
  `amount_liters` int NOT NULL,
  `price_per_liter` int NOT NULL,
  `vehicle_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `date` date NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_service` date DEFAULT NULL,
  `vehicle_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services_list`
--

CREATE TABLE `services_list` (
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_list_id` int NOT NULL,
  `cost` int NOT NULL,
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `travel_document`
--

CREATE TABLE `travel_document` (
  `log_id` int NOT NULL,
  `date` date NOT NULL,
  `start_km` int NOT NULL,
  `end_km` int NOT NULL,
  `vehicle_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','driver') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_id` int NOT NULL,
  `created_at` date NOT NULL,
  `next_technical_exam` date NOT NULL,
  `year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_odometer` int NOT NULL,
  `insurance_expiry` date NOT NULL,
  `lisence_plate` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `driver_id_UNIQUE` (`driver_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`);

--
-- A tábla indexei `driver_assignment`
--
ALTER TABLE `driver_assignment`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `assignment_id_UNIQUE` (`assignment_id`),
  ADD KEY `vehicle_id_idx` (`vehicle_id`),
  ADD KEY `driver_id_idx` (`driver_id`);

--
-- A tábla indexei `fuelings`
--
ALTER TABLE `fuelings`
  ADD PRIMARY KEY (`fueling_id`),
  ADD UNIQUE KEY `fueling_id_UNIQUE` (`fueling_id`),
  ADD KEY `vehicle_id_idx` (`vehicle_id`);

--
-- A tábla indexei `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_id_UNIQUE` (`service_id`),
  ADD KEY `vehicle_id_idx` (`vehicle_id`);

--
-- A tábla indexei `services_list`
--
ALTER TABLE `services_list`
  ADD PRIMARY KEY (`service_list_id`),
  ADD UNIQUE KEY `service_list_id_UNIQUE` (`service_list_id`),
  ADD KEY `service_id_idx` (`service_id`);

--
-- A tábla indexei `travel_document`
--
ALTER TABLE `travel_document`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `log_id_UNIQUE` (`log_id`),
  ADD KEY `vehicle_id_idx` (`vehicle_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- A tábla indexei `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `vehicle_id_UNIQUE` (`vehicle_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `driver_assignment`
--
ALTER TABLE `driver_assignment`
  MODIFY `assignment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `fuelings`
--
ALTER TABLE `fuelings`
  MODIFY `fueling_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `services_list`
--
ALTER TABLE `services_list`
  MODIFY `service_list_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `travel_document`
--
ALTER TABLE `travel_document`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `fk_driver_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Megkötések a táblához `driver_assignment`
--
ALTER TABLE `driver_assignment`
  ADD CONSTRAINT `fk_assignment_driver` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `fk_assignment_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);

--
-- Megkötések a táblához `fuelings`
--
ALTER TABLE `fuelings`
  ADD CONSTRAINT `fk_fueling_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);

--
-- Megkötések a táblához `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_service_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);

--
-- Megkötések a táblához `services_list`
--
ALTER TABLE `services_list`
  ADD CONSTRAINT `fk_list_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Megkötések a táblához `travel_document`
--
ALTER TABLE `travel_document`
  ADD CONSTRAINT `fk_travel_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
