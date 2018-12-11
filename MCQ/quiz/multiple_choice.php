<?php 
ob_start();
session_start();
include '../dbconnect.php';

?>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Activities</title>
</head>
<body>
    <p>Multiple Choice Questions</p>
    <?php 

    $res=mysqli_query($conn, "SELECT * FROM questions WHERE type_of_question Like 'multiple_choice'");

    while ($res_row = $res->fetch_assoc()) {
        $question = $res_row['question'];
        $answer = $res_row['answer_id'];
        $question_id= $res_row['question_id'];
        echo "<p>" . $question . "</p>";
        echo "<input id='" . $question_id . " value='" . $answer . "' disabled hidden>";
        $ans = mysqli_query($conn, "SELECT * FROM  answers WHERE question_id = $question_id");


        while ($ans_row = $ans->fetch_assoc()) {
            $answer = $ans_row['answer'];
            $answer_id = $ans_row['answer_id'];
            echo "<input type='radio'>" . $answer . "</input>";
            echo "<br>";
        }

    } 
    ?>
    <button type="submit" name="check" id="check"> Check </button>
</body>
</html>

<script type="text/javascript">
    document.getElementById("check").addEventListener("click", checkFunction);

    function checkFunction(){
        
    }
</script>


<!-- 
Checking algo
1. get selected radio 
2. 
-->