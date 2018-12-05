function populate() {
    if(quiz.isEnded()) {
        showScores();
    }
    else {
        // show question
        var element = document.getElementById("question");
        element.innerHTML = quiz.getQuestionIndex().text;

        // show options
        var choices = quiz.getQuestionIndex().choices;
        for(var i = 0; i < choices.length; i++) {
            var element = document.getElementById("choice" + i);
            element.innerHTML = choices[i];
            guess("btn" + i, choices[i]);
        }

        showProgress();
    }
};

function guess(id, guess) {
    var button = document.getElementById(id);
    button.onclick = function() {
        quiz.guess(guess);
        populate();
    }
};


function showProgress() {
    var currentQuestionNumber = quiz.questionIndex + 1;
    var element = document.getElementById("progress");
    element.innerHTML = "Question " + currentQuestionNumber + " of " + quiz.questions.length;
};

function showScores() {
    var gameOverHTML = "<h1>Result</h1>";
    gameOverHTML += "<h2 id='score'> Your scores: " + quiz.score + "</h2>";
    var element = document.getElementById("quiz");
    element.innerHTML = gameOverHTML;
};

// create questions
var questions = [
    new Question("1. what does PHP stands for?", ["A.Personal Homing Price", "B.Page Home Personal","C.President Houston Porque", "D.Personal Home Page"], "D.Personal Home Page"),
    new Question("2. What does HTML stands for?", ["A.HyperText Mark-up Language", "B.Hypertest Mark-up Lang", "C.HTML", "D.All of the above"], "A.HyperText Mark-up Language"),
    new Question("3. Choose which language is used in server side?", ["A.Java", "B.HTML","C.Rust", "D.Css"], "A.Java"),
    new Question("4. Which language is used for web apps?", ["A.PHP", "B.Python", "C.Javascript", "D.All"], "D.All"),
    new Question("5.The letter C stands for in the css?", ["A.Cascading", "B.Calibrating", "C.Croping", "D.Copping"], "A.Cascading"),
    new Question("6.what does PHP stands for?", ["A.Personal Homing Price", "B.Page Home Personal","C.President Houston Porque", "D.Personal Home Page"], "D.Personal Home Page"),
    new Question("7.What does HTML stands for?", ["A.HyperText Mark-up Language", "B.Hypertest Mark-up Lang", "C.HTML", "D.All of the above"], "A.HyperText Mark-up Language"),
    new Question("8.Choose which language is used in server side?", ["A.Java", "B.HTML","C.Rust", "D.Css"], "A.Java"),
    new Question("9.Which language is used for web apps?", ["A.PHP", "B.Python", "C.Javascript", "D.All"], "D.All"),
    new Question("10.The letter C stands for in the css?", ["A.Cascading", "B.Calibrating", "C.Croping", "D.Copping"], "A.Cascading")
];

// create quiz
var quiz = new Quiz(questions);

// display quiz
populate();





