<?php 
ob_start();
session_start();
include '../dbconnect.php';
if (isset($_POST['check'])) {

    $score = 0;
    foreach ($_POST as $key => $value) {
        if ($key != 'check') {
            $ids = explode(',', $key);
            $q_id = $ids[1];

            $res=mysqli_query($conn, "SELECT * FROM answers WHERE question_id = $q_id and letter = '$value'");

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

            $res=mysqli_query($conn, "SELECT * FROM questions WHERE type_of_question Like 'matching_type'");
            $count = 1;
            while ($res_row = $res->fetch_assoc()) {
                $question = $res_row['question'];
                echo "<p>" . $count . ". " . $question . "</p>";
                $question_id= $res_row['question_id'];
                echo "<input type='input' name='matchingTypeAnswer," . $question_id . "' ></br>";
                $count++;   
            } 
        ?>
        <button type="submit" name="check" id="check"> Check </button>
    </form>

    <div>
        <?php 

            $result = mysqli_query($conn, "SELECT letter, answer FROM questions JOIN answers on questions.question_id = answers.question_id WHERE questions.type_of_question like 'matching_type' order by letter ASC");

            while ($result_row = $result->fetch_assoc()) {
                $answer_letter = $result_row['letter'];
                $answer_name = $result_row['answer'];
                echo "<p>" . $answer_letter . '. ' . $answer_name . "</p>";
            }
         ?>
    </div>
</body>
</html>

<!-- 
Checking algo
1. get selected radio 
2. 
-->