<?php 
    ob_start();
    session_start();
    include '../dbconnect.php';


    if (isset($_POST['check'])) {
        $score = 0;
        foreach ($_POST as $key => $a) {
            if ($key != 'check') {
                $id = explode(',', $key);
                $q_id = $id[1];
                $answer = trim($a);
                $res=mysqli_query($conn, "SELECT * FROM questions JOIN answers WHERE questions.question_id = $q_id and answers.answer like '$answer'");

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
    <p>Enumeration</p>
    <form method="POST">
        <?php 

        $res=mysqli_query($conn, "SELECT * FROM questions where type_of_question like 'identification'");

        $count = 1;

        while ($res_row = $res->fetch_assoc()) {
            $question = $res_row['question'];
            echo "<p>" . $count . ". " . $question . "</p>";
            $question_id= $res_row['question_id'];
            echo "<input type='input' name='identificationAnswer," . $question_id . "' ></br>";

            $count++;

        } 
        ?>
        <button type="submit" name="check" id="check"> Check </button>
    </form>
</body>
</html>

