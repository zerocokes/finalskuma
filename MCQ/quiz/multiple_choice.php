<?php 
ob_start();
session_start();
include '../dbconnect.php';

if (isset($_POST['check'])) {
    foreach ($_POST['check'] as $answer) {
            # code...
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
    <p>Multiple Choice Questions</p>
    <form type="POST">
        <?php 

        $res=mysqli_query($conn, "SELECT * FROM questions");

        while ($res_row = $res->fetch_assoc()) {
            $question = $res_row['question'];
            echo "<p>" . $question . "</p>";
            $question_id= $res_row['question_id'];
            $ans = mysqli_query($conn, "SELECT answer FROM  answers WHERE question_id = $question_id");


            while ($ans_row = $ans->fetch_assoc()) {
                $answer = $ans_row['answer'];
                echo "<input type='radio' name='answer" . $question_id . "'>" . $answer . "</input>";
                echo "<br>";
            }

        } 
        ?>
        <button type="submit" name="check"> Check </button>
    </form>
</body>
</html>