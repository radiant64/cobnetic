<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{:?CBN_SITETITLE ifelse(CBN_PAGETITLE,,,- CBN_PAGETITLE)?:}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{:?CBN_DESCRIPTION?:}">
</head>
<body>
{:?ifelse(?:}HEADER{:?,,,?:}HEADER{:?)?:}
{:?ifelse(?:}MENU0_TITLE{:?,,,?:}
<nav>
    <ul>
        <li><a href="{:?MENU0_URL?:}">{:?MENU0_TITLE?:}</a></li>
        <li><a href="{:?MENU1_URL?:}">{:?MENU1_TITLE?:}</a></li>
    </ul>
</nav>{:?)?:}
{:?CBN_MARKDOWNCONTENT?:}
{:?ifelse(?:}FOOTER{:?,,,?:}
<footer>
    <hr>
    FOOTER
</footer>{:?
)?:}
</body>
</html>

