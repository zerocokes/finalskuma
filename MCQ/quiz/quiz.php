<?php 
    if (isset($_GET["quiz_type"]) == "multiple_choice") {
        header("Location: multiple_choice.php");
        exit;
    }
 ?>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Activityies</title>
</head>
<body>
    <div>
        <form type="get">
            <button type="submit" name="quiz_type" value="multiple_choice">Multiple Choice</button>
        </form>
    </div>
    <div class="grid">
        <div id="quiz">
            <h1>Multiple Choice</h1>
            <hr style="margin-bottom: 20px">

            <p id="question"></p>

            <div class="buttons">
                <button id="btn0"><span id="choice0"></span></button>
                <button id="btn1"><span id="choice1"></span></button>
                <button id="btn2"><span id="choice2"></span></button>
                <button id="btn3"><span id="choice3"></span></button>
            </div>

            <hr style="margin-top: 50px">
           
        </div>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <ul class="dropdown-menu">
                  <a href="logout.php?logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Sign Out</a></li>
                </ul>
    </div>

<script src="quiz.js"></script>
<script src="question.js"></script>
<script src="app.js"></script>
</body>
</html>