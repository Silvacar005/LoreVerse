-- LoreVerse - Five starting games
-- Run this AFTER creating/importing the loreverse schema.
-- Safe to execute more than once; it inserts missing games only.
-- Resident Evil 4 refers to the ORIGINAL 2005 release, not the 2023 remake.

USE loreverse;

-- Preserve the Cyberpunk 2077 record and its existing character/lore links.
UPDATE games AS g
INNER JOIN franchises AS f ON f.slug = 'cyberpunk'
SET g.franchise_id = f.franchise_id
WHERE g.title = 'Cyberpunk 2077'
  AND (g.franchise_id IS NULL OR g.franchise_id <> f.franchise_id);

-- Each INSERT...SELECT finds its franchise ID automatically.
-- NOT EXISTS prevents duplicate titles when this is rerun.
INSERT INTO games (title, developer, release_date, description, franchise_id)
SELECT 'Resident Evil 4', 'Capcom Production Studio 4', '2005-01-11',
       'Leon S. Kennedy investigates a mysterious cult in rural Spain while searching for the kidnapped Ashley Graham.',
       f.franchise_id
FROM franchises AS f
WHERE f.slug = 'resident-evil'
  AND NOT EXISTS (SELECT 1 FROM games WHERE title = 'Resident Evil 4');

INSERT INTO games (title, developer, release_date, description, franchise_id)
SELECT 'Grand Theft Auto: San Andreas', 'Rockstar North', '2004-10-26',
       'Carl Johnson returns to San Andreas, where family loyalties, gang rivalries, and corrupt police shape his journey.',
       f.franchise_id
FROM franchises AS f
WHERE f.slug = 'grand-theft-auto'
  AND NOT EXISTS (SELECT 1 FROM games WHERE title = 'Grand Theft Auto: San Andreas');

INSERT INTO games (title, developer, release_date, description, franchise_id)
SELECT 'Assassin''s Creed II', 'Ubisoft Montreal', '2009-11-17',
       'Ezio Auditore uncovers a conspiracy in Renaissance Italy while learning the ways of the Assassins.',
       f.franchise_id
FROM franchises AS f
WHERE f.slug = 'assassins-creed'
  AND NOT EXISTS (SELECT 1 FROM games WHERE title = 'Assassin''s Creed II');

INSERT INTO games (title, developer, release_date, description, franchise_id)
SELECT 'The Legend of Zelda: Tears of the Kingdom', 'Nintendo EPD', '2023-05-12',
       'Link explores the land and skies of Hyrule while confronting a threat to the kingdom.',
       f.franchise_id
FROM franchises AS f
WHERE f.slug = 'zelda'
  AND NOT EXISTS (SELECT 1 FROM games WHERE title = 'The Legend of Zelda: Tears of the Kingdom');

SELECT g.game_id, g.title, f.name AS franchise, g.developer, g.release_date
FROM games AS g
LEFT JOIN franchises AS f ON f.franchise_id = g.franchise_id
ORDER BY f.name, g.title;
