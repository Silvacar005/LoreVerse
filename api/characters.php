<?php

header("Content-Type: application/json; charset=utf-8");

require_once __DIR__ . "/../config/db.php";

try {
    $pdo = connectDatabase();

    // Get the search text from the URL
    $search = trim($_GET["name"] ?? "");

    if ($search !== "") {

        // Search for matching characters
        $sql = "SELECT *
                FROM characters
                WHERE name LIKE :search
                ORDER BY name";

        $stmt = $pdo->prepare($sql);

        $stmt->execute([
            "search" => "%" . $search . "%"
        ]);

    } else {

        // No search provided: return everyone
        $sql = "SELECT *
                FROM characters
                ORDER BY name";

        $stmt = $pdo->query($sql);
    }

    $characters = $stmt->fetchAll();

    echo json_encode(
        $characters,
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE
    );

} catch (PDOException $e) {
    error_log($e->getMessage());

    http_response_code(500);

    echo json_encode([
        "error" => "Database request failed"
    ]);
}
