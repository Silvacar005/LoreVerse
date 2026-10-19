# LoreVerse

A developing full-stack video game lore encyclopedia built using **PHP, MySQL, HTML, CSS, and JavaScript**. LoreVerse aims to make game universes explorable through searchable characters, factions, locations, stories and linked historical events, with a future API-powered mobile app.

## Project status

**Early development / local prototype.** The app currently includes:

- A database-driven homepage displaying five franchises and the games assigned to each.
- A working PHP/PDO endpoint for searching characters by partial name.
- A simple JavaScript character explorer using `fetch()`.
- A MySQL schema with games, franchises, characters, factions, locations, lore entries, and junction tables for their relationships.
- Seed records for **Cyberpunk 2077**, including Johnny Silverhand, Jackie Welles, Samurai, Arasaka, Night City, and an introductory lore article. An additional SQL script adds **Resident Evil 4 (2005), Grand Theft Auto: San Andreas, Assassin's Creed II, and The Legend of Zelda: Tears of the Kingdom**.

**Not implemented yet:** automated game imports, full character dossier pages, user accounts, image library, live deployment, a production-ready mobile app. `character.php` is currently an empty placeholder.

## Quick start (local Windows/XAMPP)

1. Install XAMPP (Apache, PHP with PDO MySQL) and a compatible MySQL server. Start Apache and MySQL.
2. Put this folder in `C:\xampp\htdocs\Loreverse` (or update the URL to match your folder).
3. Using MySQL Workbench or phpMyAdmin, import **`database/loreverse.sql`** into your local MySQL server. **Caution:** the included SQL dump contains `DROP TABLE IF EXISTS` and will overwrite those existing LoreVerse tables; back up any existing LoreVerse database before importing. It is intended for a fresh local database.
4. Copy `config/db.example.php` to `config/db.php`. For default XAMPP local MySQL, this may work as-is; otherwise configure the connection with the `LOREVERSE_DB_HOST`, `LOREVERSE_DB_PORT`, `LOREVERSE_DB_NAME`, `LOREVERSE_DB_USER`, and `LOREVERSE_DB_PASSWORD` environment variables or modify only the ignored local file. Do not commit credentials.
5. Run **`database/seed-five-games.sql`** against your existing `loreverse` database to add the four missing games. You can safely rerun this script; do **not** reimport `database/loreverse.sql` into an existing populated database because that dump drops tables.
6. Open `http://localhost/Loreverse/index.php` and `http://localhost/Loreverse/explore.php`.
7. Test the API at `http://localhost/Loreverse/api/characters.php`, with optional filtering such as `?name=Johnny` or `?name=Jackie`.

> MySQL Workbench and XAMPP can connect to **different** database servers. Make sure your imported database is on the MySQL instance that PHP uses.

## Project structure

```text
Loreverse/
├── api/
│   └── characters.php          # JSON character search endpoint
├── assets/                     # Static media (currently empty)
├── config/
│   └── db.example.php          # Template; copy to ignored db.php
├── css/
│   └── site.css                # Basic global and franchise colors
├── database/
│   ├── loreverse.sql           # MySQL structure + prototype seed data
│   └── seed-five-games.sql    # Non-destructive inserts for four more games
├── js/
│   └── explore.js              # Fetch and display search results
├── character.php               # Unimplemented profile placeholder
├── explore.php                 # Character explorer page
├── index.php                   # Franchise homepage
└── .gitignore
```

## Planned features

- Rich sourced character biographies, appearances, and relationships
- Fictional historical timelines, lore articles, and location explorer
- Franchise and game-level search, including cross-game appearances
- Optional Wikidata / IGDB metadata integration (subject to access and licensing rules)
- API enhancements and eventual companion mobile app

## Security and content notes

- `config/db.php` and API credentials are excluded by `.gitignore`. **Never commit real secrets.** If you already committed a credential, remove it from Git history and rotate it.
- The API currently returns prototype character data. Before public deployment, add production hardening (authentication and input limits where needed, rate limiting, logging, database user with limited privileges, and privacy/security reviews).
- Game names and fictional universe references belong to their respective owners. LoreVerse is an independent fan/educational project, not affiliated with the game publishers. When adding images, wiki articles, or other external content, verify permission, licensing and required attribution.

## License

No software license has been selected yet. Please do not assume third-party game content or artwork is freely redistributable.