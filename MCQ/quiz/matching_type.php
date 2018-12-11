<?php 
ob_start();
session_start();
include '../dbconnect.php';
if (isset($_POST['check'])) {

    $score = 0;
    foreach ($_POST as $key => $value) {
        if ($key != 'check') {
            $ids = explode(',', $value);
            $q_id = $ids[0];
            $a_id = $ids[1];

            $res=mysqli_query($conn, "SELECT * FROM questions WHERE question_id = $q_id and answer_id = $a_id");

            if (($res->num_rows) > 0) {
              $score++;  
            }

        }
    }

    echo $score;
}

?>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Activities</title>
</head>
<body> 
    <form method="POST">
        <p>Multiple Choice Questions</p>
        <?php 

            $res=mysqli_query($conn, "SELECT * FROM questions WHERE type_of_question Like 'multiple_choice'");

            while ($res_row = $res->fetch_assoc()) {
                $question = $res_row['question'];
                $question_id= $res_row['question_id'];
                echo "<p>" . $question . "</p>";
                echo "<br>";
                $ans = mysqli_query($conn, "SELECT * FROM  answers WHERE question_id = $question_id");


                while ($ans_row = $ans->fetch_assoc()) {
                    $answer = $ans_row['answer'];
                    $answer_id = $ans_row['answer_id'];
                    echo "<input type='radio' name='answer," . $question_id . "' value='" . $question_id . ',' . $answer_id . "'>" . $answer . "</input>";
                    echo "<br>";
                }

            } 
        ?>
        <button type="submit" name="check" id="check"> Check </button>
    </form>
</body>
</html>

<!-- 
Checking algo
1. get selected radio 
2. 
-->