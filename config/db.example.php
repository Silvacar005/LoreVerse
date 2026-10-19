<?php
/**
 * Copy this file to db.php and set up your local MySQL credentials.
 * db.php is deliberately excluded from Git by .gitignore.
 */
function connectDatabase(): PDO
{
    $host = getenv('LOREVERSE_DB_HOST') ?: '127.0.0.1';
    $port = getenv('LOREVERSE_DB_PORT') ?: '3306';
    $database = getenv('LOREVERSE_DB_NAME') ?: 'loreverse';
    $username = getenv('LOREVERSE_DB_USER') ?: 'root';
    $password = getenv('LOREVERSE_DB_PASSWORD') ?: '';

    $dsn = "mysql:host=$host;port=$port;dbname=$database;charset=utf8mb4";
    return new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
}
