var questionNumber = 1;
var answers = [];
var goodAnswers = [];
var questionUsed = [];
var selectedCategory = null

var QuestionsCount = {["HELICOPTER"]: 0, ["PLANE"]: 0} // config.lua -> Config.Questions
var QuestionToAnswer = {["HELICOPTER"]: 0, ["PLANE"]: 0} // config.lua -> Config.Questions
var NeedAnswersToPass = {["HELICOPTER"]: 0, ["PLANE"]: 0} // config.lua -> Config.Questions

var max

window.addEventListener("load", function(){
	$.post(`https://${GetParentResourceName()}/loaded`);
});

window.addEventListener('message', function(event) {
  	var data = event.data
  	switch (data.action) {
		case 'loaded':
			let lang = data.lang;
			$.ajax({
				url: '../config/translation.json',
				type: 'GET',
				dataType: 'json',
				success: function (code, statut) {
					if (!code[lang]) {
						translation = code["EN"];
						console.warn(`^7Selected language ^1"${lang}"^7 not found, changed to ^2"EN"^7, configure your language in translation.json.`);
					} else {
						translation = code[lang];
					}

					$("#title-name").html(translation.exam_practicaly);
					$(".question-text").html(translation.question)
					$(".theory-next > span").html(translation.next_question)
					$(".good-result-menu > .result-infos > .result-title").html(translation.good_result_title)
					$(".good-result-menu > .result-infos > .result-percentage > #your_score").html(translation.your_score)
					$(".good-result-menu > .result-infos > .result-description").html(translation.good_result_description)
					$(".good-result-close > span").html(translation.good_result_close)
					$(".bad-result-menu > .result-infos > .result-title").html(translation.bad_result_title)
					$(".bad-result-menu > .result-infos > .result-percentage > #your_score").html(translation.your_score)
					$(".bad-result-menu > .result-infos > .result-description").html(translation.bad_result_description)
					$(".bad-result-close > span").html(translation.bad_result_close)
				}
			})
			break;
		case 'openTheory':
			$('.theory-menu').show()
			$('.question-menu').show()
			selectedCategory = data.category
			QuestionsCount[selectedCategory] = data.questions.QuestionsCount
			QuestionToAnswer[selectedCategory] = data.questions.QuestionToAnswer
			NeedAnswersToPass[selectedCategory] = data.questions.NeedAnswersToPass
			$('.theory-progress-done').css('width', `0%`)
			$('.theory-questions-info > .max').html(QuestionToAnswer[selectedCategory])
			openQuestion()
			break;
		case 'closeTheory':
			$('.good-result-menu').hide();
			$('.bad-result-menu').hide();
			$('.question-menu').hide();
			$('.theory-menu').hide();
			selectedCategory = null;
			questionNumber = 1;
			answers = [];
			goodAnswers = [];
			questionUsed = [];
			break;
    	case 'openTasks':
			$(".tasks-menu").fadeIn(285);
			$(".tasks-list").empty();
			$('.done-percentage').css('width', `0%`)
			for (const [key, value] of Object.entries(data.tasks)) {
				$(".tasks-list").append(`
					<div id="${value.id}">
						<div class="task-label task-todo">${value.label}</div>
						<div class="task-value task-todo-count">
							<i class="fa-solid fa-circle-check"></i>
						</div>
					</div>
				`)
			}
			max = data.maxPoints
			break;
		case 'updateTasks':
			$(`#${data.done} > .task-label`).addClass('task-done')
			$(`#${data.done} > .task-value`).addClass('task-done-icon')
			$(`#${data.done} > .task-label`).removeClass('task-todo')
			$(`#${data.done} > .task-value`).removeClass('task-todo-count')
			$('.done-percentage').css('width', `${(100 * data.id) / max}%`)
			break
		case 'updateTaskProgress':
			$(`#${data.id} > .task-label > span`).html(`${data.value}`)
			break
		case 'closeTasks':
			$(".tasks-menu").fadeOut(285);
			break;
		case 'audioTask':
			var audioTask = new Audio(`tasks_audio/${data.filename}`);
			audioTask.play();
			break
  	}
})

function getRandomQuestion() {
	var random = Math.floor(Math.random() * QuestionsCount[selectedCategory])
	while (true) {
		if (questionUsed.indexOf(random) === -1) {
			break
		}
		random = Math.floor(Math.random() * QuestionsCount[selectedCategory])
	}
	questionUsed.push(random)
	return random
}

function openQuestion() {
	var randomQuestion = getRandomQuestion();

	$('.theory-progress-done').css('width', `${(100 * (questionNumber - 1)) / QuestionToAnswer[selectedCategory]}%`)

	$(".theory-image").empty()
	if (questions[selectedCategory][randomQuestion].questionPhoto) {
		$(".theory-image").html(`<img src="questions_images/${selectedCategory+`-`+questions[selectedCategory][randomQuestion].questionPhoto}">`)
	} else {
		$(".theory-image").html(`<img src="questions_images/nophoto.png">`)
	}

	$(".theory-questions-info > .current").html(questionNumber);
	$(".theory-question").html(questions[selectedCategory][randomQuestion].question);

	$("#a-answer").hide()
	if (questions[selectedCategory][randomQuestion].a) {
		$("#a").prop("checked", false);
		$(".a").html(questions[selectedCategory][randomQuestion].a);
		$("#a-answer").show()
	}
	$("#b-answer").hide()
	if (questions[selectedCategory][randomQuestion].b) {
		$("#b").prop("checked", false);
		$(".b").html(questions[selectedCategory][randomQuestion].b);
		$("#b-answer").show()
	}
	$("#c-answer").hide()
	if (questions[selectedCategory][randomQuestion].c) {
		$("#c").prop("checked", false);
		$(".c").html(questions[selectedCategory][randomQuestion].c);
		$("#c-answer").show()
	}
	$("#d-answer").hide()
	if (questions[selectedCategory][randomQuestion].d) {
		$("#d").prop("checked", false);
		$(".d").html(questions[selectedCategory][randomQuestion].d);
		$("#d-answer").show()
	}
	goodAnswers.push(questions[selectedCategory][randomQuestion].correctAnswer);
}

function closeQuestion(passed) {
	$.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
		action: 'close',
		passed: passed
	}));
}

$(".good-result-close").click(function(){
	closeQuestion(true)
});

$(".bad-result-close").click(function(){
	closeQuestion(false)
});

$(".theory-next").click(function(e) {
	e.preventDefault();
	if ($('input[name="question"]:checked').val()) {
	  	if(questionNumber != QuestionToAnswer[selectedCategory]){
			answers.push($('input[name="question"]:checked').val());
			questionNumber++;
			openQuestion()
			$.post(`https://${GetParentResourceName()}/action`, JSON.stringify({action: 'playSound', type: 'nextQuestion'}));
		} else {
			answers.push($('input[name="question"]:checked').val());
			var nbGoodAnswer = 0;
			for (i = 0; i < QuestionToAnswer[selectedCategory]; i++) {
				if (answers[i] == goodAnswers[i]) {
					nbGoodAnswer++;
				}
			}
			$('.question-menu').hide()
			if (nbGoodAnswer >= NeedAnswersToPass[selectedCategory]) {
				$('.good-result-menu').show()
				$('.good-result-menu > .result-infos > .result-percentage > #score').html(`${Number((100 * nbGoodAnswer) / QuestionToAnswer[selectedCategory]).toFixed(0)}%`)
				$.post(`https://${GetParentResourceName()}/action`, JSON.stringify({action: 'playSound', type: 'passedExam'}));
			} else {
				$('.bad-result-menu').show()
				$('.bad-result-menu > .result-infos > .result-percentage > #score').html(`${Number((100 * nbGoodAnswer) / QuestionToAnswer[selectedCategory]).toFixed(0)}%`)
				$.post(`https://${GetParentResourceName()}/action`, JSON.stringify({action: 'playSound', type: 'failedExam'}));
			}
		}
		return false;
	}
});