
if (Test-Path $args[0] -PathType Container) {
    "Папка"
} elseif (Test-Path $args[0] -PathType Leaf) {
    "Файл"
} else {
    "Объект не существует или другой тип"
}