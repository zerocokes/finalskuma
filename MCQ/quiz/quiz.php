<?php 
if(isset($_GET["quiz_type"])){
    if($_GET["quiz_type"] == "multiple_choice"){
            header("Location: multiple_choice.php");
    }else if($_GET["quiz_type"] == "enumeration") {
            header("Location: enumeration.php");
    }else if($_GET["quiz_type"] == "identification"){
            header("Location: identification.php");
    }else if($_GET["quiz_type"] == "matching_type") {
            header("Location: matching_type.php");
    }
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