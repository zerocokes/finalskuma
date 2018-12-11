<?php 
    ob_start();
    session_start();
    include '../dbconnect.php';


    if (isset($_POST['check'])) {
        $score = 0;
        foreach ($_POST as $key => $answer) {
            if ($key != 'check') {
                $id = explode(',', $key);
                $q_id = $id[1];
                $res=mysqli_query($conn, "SELECT * FROM answers WHERE question_id = $q_id and answer like $answer)");

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

        $res=mysqli_query($conn, "SELECT * FROM questions where type_of_question like 'enumeration'");

        $count = 1;

        while ($res_row = $res->fetch_assoc()) {
            $question = $res_row['question'];
            echo "<p>" . $count . ". " . $question . "</p>";
            $question_id= $res_row['question_id'];
            $number_of_answers = $res_row['no_of_answers'];

            for ($i=0; $i < $number_of_answers;$i++) { 
                echo "<input type='input' name='enumerationAnswer," . $question_id . "," . $i . "' ></br>";
            }

            $count++;

        } 
        ?>
        <button type="submit" name="check" id="check"> Check </button>
    </form>
</body>
</html>