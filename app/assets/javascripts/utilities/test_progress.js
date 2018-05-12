document.addEventListener('turbolinks:load', function() {
    var progress = document.querySelector('.progress-bar');

    if (progress) {
        var questionNumber = progress.dataset.questionNumber - 1;
        var questionsCount = progress.dataset.questionsCount;

        progress.style.width = ((100 * questionNumber) / questionsCount) + '%';
    }
});
