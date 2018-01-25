

$(document).ready(function(){
  var prevLinkElement = $(".js-prev");
  var nextLinkElement = $(".js-next");
  var id = prevLinkElement.attr("data-id");
  var triviaSessionsUrl = "/trivia_sessions/" + id + ".json";

  loadCurrentResults(id, triviaSessionsUrl);

  prevLinkElement.on("click", loadPreviousResults);
  nextLinkElement.on("click", loadNextResults);
});

function loadCurrentResults(id, triviaSessionsUrl){
  $.getJSON(triviaSessionsUrl, function(data){
    var triviaTitle = data.trivia_session.trivia.title;
    var playedTriviaScore = data.trivia_session.score;
    var triviaFeedback = data.trivia_session.feedback;
    $(".js-result").html("<h3>Your Score for "  + triviaTitle + " is: " + playedTriviaScore + "</h3>");
    $(".js-feedback").html("<h4>Your feedback for Trivia was: " + triviaFeedback + "</h4>");
    $(".js-prev").attr("data-id", data.trivia_session.meta.previous);
    $(".js-next").attr("data-id", data.trivia_session.meta.next);
  });
}

function loadPreviousResults() {
  var prevId = $(".js-prev").attr("data-id");
  if (prevId) {
    $(".js-next").text("Next...");

    var prevTriviaSessionsUrl = "/trivia_sessions/" + prevId + ".json";
    $.getJSON(prevTriviaSessionsUrl, function (prevTriviaSessionData) {
      var triviaTitle = prevTriviaSessionData.trivia_session.trivia.title;
      var playedTriviaScore = prevTriviaSessionData.trivia_session.score;
      var triviaFeedback = prevTriviaSessionData.trivia_session.feedback;
      $(".js-result").html("<h3>Your Score for " + triviaTitle + " is: " + playedTriviaScore + "</h3>");
      if (triviaFeedback) {
        $(".js-feedback").html("<h4>Your feedback for Trivia was: " + triviaFeedback + "</h4>");
      } else {
        $(".js-feedback").html("<p>No feedback available</p>");
      }
      $(".js-prev").attr("data-id", prevTriviaSessionData.trivia_session.meta.previous);
      $(".js-next").attr("data-id", prevTriviaSessionData.trivia_session.meta.next);
    });
    } else {
      $(".js-prev").text("");
  }
}

function loadNextResults() {
  var nextId = $(".js-next").attr("data-id");
  if (nextId) {
    $(".js-prev").text("...Prev");

    var nextTriviaSessionsUrl = "/trivia_sessions/" + nextId + ".json";
    $.getJSON(nextTriviaSessionsUrl, function (nextTriviaSessionsData) {
      var triviaTitle = nextTriviaSessionsData.trivia_session.trivia.title;
      var playedTriviaScore = nextTriviaSessionsData.trivia_session.score;
      var triviaFeedback = nextTriviaSessionsData.trivia_session.feedback;
      $(".js-result").html("<h3>Your Score for " + triviaTitle + " is: " + playedTriviaScore + "</h3>");
      if (triviaFeedback) {
        $(".js-feedback").html("<h4>Your feedback for Trivia was: " + triviaFeedback + "</h4>");
      } else {
        $(".js-feedback").html("<p>No feedback available</p>");
      }
      $(".js-prev").attr("data-id", nextTriviaSessionsData.trivia_session.meta.previous);
      $(".js-next").attr("data-id", nextTriviaSessionsData.trivia_session.meta.next);
    });
  } else {
    $(".js-next").text("");
  }
}
