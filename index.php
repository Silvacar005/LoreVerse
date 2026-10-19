<?php
require_once __DIR__ . "/config/db.php";

$pdo = connectDatabase();

// Load all franchises and their games from MySQL.
$franchises = $pdo->query(
    "SELECT franchise_id, name, slug FROM franchises ORDER BY name"
)->fetchAll();

$games = $pdo->query(
    "SELECT game_id, franchise_id, title, release_date
     FROM games
     WHERE franchise_id IS NOT NULL
     ORDER BY release_date, title"
)->fetchAll();

$gamesByFranchise = [];
foreach ($games as $game) {
    $gamesByFranchise[$game["franchise_id"]][] = $game;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoreVerse | Explore Universes</title>
    <link rel="stylesheet" href="css/site.css">
</head>
<body>

<header class="site-header">
    <a class="logo" href="index.php">LORE<span>VERSE</span></a>
    <nav><a href="explore.php">Character Explorer</a></nav>
</header>

<main>
    <section class="hero">
        <p class="eyebrow">THE STORIES BEYOND THE GAME</p>
        <h1>Every universe has a story.</h1>
        <p>Explore characters, histories, factions and timelines from your favorite games.</p>
    </section>

    <section class="library">
        <h2>Explore Universes</h2>
        <div class="universe-grid">
        <?php foreach ($franchises as $franchise): ?>
            <?php $franchiseGames = $gamesByFranchise[$franchise["franchise_id"]] ?? []; ?>
            <article class="universe-card"
                     data-franchise="<?= htmlspecialchars($franchise['slug'], ENT_QUOTES, 'UTF-8') ?>">
                <h3><?= htmlspecialchars($franchise['name'], ENT_QUOTES, 'UTF-8') ?></h3>
                <p><?= count($franchiseGames) ?> game(s) in library</p>

                <?php if ($franchiseGames): ?>
                    <ul class="game-list">
                    <?php foreach ($franchiseGames as $game): ?>
                        <li>
                            <?= htmlspecialchars($game['title'], ENT_QUOTES, 'UTF-8') ?>
                            <small><?= htmlspecialchars(substr($game['release_date'] ?? '', 0, 4), ENT_QUOTES, 'UTF-8') ?></small>
                        </li>
                    <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <p>New games coming soon.</p>
                <?php endif; ?>

                <?php if ($franchise['slug'] === 'cyberpunk'): ?>
                    <a href="explore.php">Explore Cyberpunk characters →</a>
                <?php else: ?>
                    <span>Character profiles coming soon</span>
                <?php endif; ?>
            </article>
        <?php endforeach; ?>
        </div>
    </section>
</main>

<footer><p>LoreVerse — Explore the stories behind the games.</p></footer>
</body>
</html>
