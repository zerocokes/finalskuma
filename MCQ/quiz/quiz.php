<?php 
if (isset($_GET["quiz_type"]) == "multiple_choice") {
    header("Location: multiple_choice.php");
    exit;
}elseif (isset($_GET["quiz_type"]) == "enumeration") {
    header("Location: enumeration.php");
    exit;
}

?>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Activities</title>
</head>
<body>
    <div>
        <form type="get">
            <button type="submit" name="quiz_type" value="multiple_choice">Multiple Choice</button>
            <button type="submit" name="quiz_type" value="enumeration">Enumeration</button>
            <button type="submit" name="quiz_type" value="identification">Identification</button>
            <button type="submit" name="quiz_type" value="matching_type">Matching Type</button>
        </form>
        <a href="logout.php?logout"></span>&nbsp;Sign Out</a>
    </div>
</body>
</html>