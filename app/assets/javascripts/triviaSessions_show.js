$(document).ready(() => {
  if($('body.trivia_sessions-show-page').length === 0) {
    return;
  }
  $('.js-prev, .js-next').on('click', function() {
    renderTriviaSessionShow(($(this).data('id')));
  });

  const currentTriviaSessionId = $('.js-current').data('current-trivia-session-id');

  renderTriviaSessionShow(currentTriviaSessionId);
});

function renderTriviaSessionShow(triviaSessionId) {
  findTriviaSession(triviaSessionId, function(triviaSession) {
    renderTemplate(triviaSession);
  });
}

function findTriviaSession(triviaSessionId, afterFindHandler) {
  const triviaSessionsUrl = `/trivia_sessions/${triviaSessionId}.json`;

  $.getJSON(triviaSessionsUrl, {}, function(data) {
    afterFindHandler(data.trivia_session);
  });
}

function renderTemplate(triviaSession) {
  const triviaFeedback = triviaSession.feedback;
  const triviaTitle = triviaSession.trivia.title;
  const playedTriviaScore = triviaSession.score;

  $('.js-result').html(`<h3>Your Score for ${triviaTitle} is: ${playedTriviaScore}</h3>`);

  if (triviaFeedback) {
    $('.js-feedback').html(`<h4>Your feedback for Trivia : ${triviaFeedback}</h4>`);
  } else {
    $('.js-feedback').html(`<p>No feedback available</p>`);
  }

  $('.js-prev').data('id', triviaSession.meta.previous);
  $('.js-next').data('id', triviaSession.meta.next);

  if (!triviaSession.meta.previous) {
    $(".js-prev").text('');
  }

  if (!triviaSession.meta.next) {
    $(".js-next").text('');
  }
}
