$(document).ready(function(){

  var id = $(".js-prev").attr("data-id");
  var triviaSessionsUrl = "/trivia_sessions/" + id + ".json";

  $.getJSON(triviaSessionsUrl, function(data){
    var triviaTitle = data.trivia_session.trivia.title;
    var playedTriviaScore = data.trivia_session.score;
    var triviaFeedback = data.trivia_session.feedback;
    console.log(triviaFeedback);
    $(".js-result").html("<h3>Your Score for "  + triviaTitle + " is: " + playedTriviaScore + "</h3>");
    $(".js-feedback").html("<h4>Your feedback for Trivia was: " + triviaFeedback + "</h4>");
    $(".js-prev").attr("data-id", data.trivia_session.meta.previous);
    $(".js-next").attr("data-id", data.trivia_session.meta.next);
  });

  $(".js-prev").on("click", function(){
    var prevId = $(".js-prev").attr("data-id");
    if (prevId) {
      var prevTriviaSessionsUrl = "/trivia_sessions/" + prevId + ".json";
      $.getJSON(prevTriviaSessionsUrl, function (prevTriviaSessionData) {
        console.log("Previous Trivia Session data:", prevTriviaSessionData);
        triviaTitle = prevTriviaSessionData.trivia_session.trivia.title;
        playedTriviaScore = prevTriviaSessionData.trivia_session.score;
        triviaFeedback = prevTriviaSessionData.trivia_session.feedback;
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
  });

  $(".js-next").on("click", function(){
    var nextId = $(".js-next").attr("data-id");
    if (nextId) {
      var nextTriviaSessionsUrl = "/trivia_sessions/" + nextId + ".json";
      $.getJSON(nextTriviaSessionsUrl, function (nextTriviaSessionsData) {
        console.log("Previous Trivia Session data:", nextTriviaSessionsData);
        triviaTitle = nextTriviaSessionsData.trivia_session.trivia.title;
        playedTriviaScore = nextTriviaSessionsData.trivia_session.score;
        triviaFeedback = nextTriviaSessionsData.trivia_session.feedback;
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
  });

});
