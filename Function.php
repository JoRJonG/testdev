<?php
include('connest.php');

function escape_mysql_identifier($field)
{
    return "`" . str_replace("`", "``", $field) . "`";
}

function insert($pdo, $table, $data)
{

    $keys = array_keys($data);
    $keys = array_map('escape_mysql_identifier', $keys);
    $fields = implode(",", $keys);
    $table = escape_mysql_identifier($table);
    $placeholders = str_repeat('?,', count($keys) - 1) . '?';
    $sql = "INSERT INTO $table ($fields) VALUES ($placeholders)";
    $pdo->prepare($sql)->execute(array_values($data));
}
?>