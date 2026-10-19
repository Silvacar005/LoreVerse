<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Explore | LoreVerse</title>
    <link rel="stylesheet" href="css/site.css">
    <script src="js/explore.js" defer></script>
</head>
<body>

    <header>
        <h1>LOREVERSE</h1>
        <p>Cyberpunk 2077 — Night City Archives</p>
    </header>

    <main>
        <h2>Explore Characters</h2>

        <form id="searchForm">
            <label for="searchInput">
                Search for a character
            </label>

            <input
                type="search"
                id="searchInput"
                placeholder="Johnny Silverhand"
            >

            <button type="submit">Search</button>
        </form>

        <p id="status" role="status"></p>

        <section id="results"
                 aria-label="Character results">
        </section>
    </main>

</body>
</html>
