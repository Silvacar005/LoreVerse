<?php
require_once __DIR__ . "/config/db.php";

$pdo = connectDatabase();

$sql = "SELECT
            f.name,
            f.slug,
            COUNT(g.game_id) AS game_count
        FROM franchises AS f
        LEFT JOIN games AS g
            ON f.franchise_id = g.franchise_id
        GROUP BY f.franchise_id, f.name, f.slug
        ORDER BY f.name";

$franchises = $pdo->query($sql)->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>LoreVerse | Explore Universes</title>
    <link rel="stylesheet" href="css/site.css">
</head>
<body>

<header class="site-header">
    <a class="logo" href="index.php">
        LORE<span>VERSE</span>
    </a>
    <nav>
        <a href="explore.php">Character Explorer</a>
    </nav>
</header>

<main>
    <section class="hero">
        <p class="eyebrow">THE STORIES BEYOND THE GAME</p>
        <h1>Every universe has a story.</h1>
        <p>
            Explore characters, histories, factions
            and timelines from your favorite games.
        </p>
    </section>

    <section class="library">
        <h2>Explore Universes</h2>

        <div class="universe-grid">
            <?php foreach ($franchises as $franchise): ?>
                <article
                    class="universe-card"
                    data-franchise="<?= htmlspecialchars(
                        $franchise['slug'], ENT_QUOTES, 'UTF-8'
                    ) ?>"
                >
                    <h3><?= htmlspecialchars(
                        $franchise['name'],
                        ENT_QUOTES,
                        'UTF-8'
                    ) ?></h3>

                    <p>
                        <?= (int)$franchise['game_count'] ?>
                        games in library
                    </p>

                    <?php if ($franchise['slug'] === 'cyberpunk'): ?>
                        <a href="explore.php">
                            Explore characters →
                        </a>
                    <?php else: ?>
                        <span>Coming soon</span>
                    <?php endif; ?>
                </article>
            <?php endforeach; ?>
        </div>
    </section>
</main>

<footer>
    <p>LoreVerse — Explore the stories behind the games.</p>
</footer>

</body>
</html>
