const form = document.getElementById("searchForm");
const input = document.getElementById("searchInput");
const results = document.getElementById("results");
const status = document.getElementById("status");

async function searchCharacters(name = "") {
    status.textContent = "Loading characters...";
    results.replaceChildren();

    try {
        const url = "api/characters.php?name="
            + encodeURIComponent(name);

        const response = await fetch(url);

        if (!response.ok) {
            throw new Error("API request failed");
        }

        const characters = await response.json();

        if (characters.length === 0) {
            status.textContent = "No characters found.";
            return;
        }

        status.textContent =
            characters.length + " character(s) found.";

        characters.forEach(character => {
            const card = document.createElement("article");

            const title = document.createElement("h3");
            title.textContent = character.name;

            const biography = document.createElement("p");
            biography.textContent =
                character.biography || "No biography yet.";

            card.append(title, biography);
            results.appendChild(card);
        });

    } catch (error) {
        console.error(error);
        status.textContent = "Unable to load characters.";
    }
}

form.addEventListener("submit", function(event) {
    event.preventDefault();
    searchCharacters(input.value.trim());
});

// Display all characters when the page opens.
searchCharacters();
