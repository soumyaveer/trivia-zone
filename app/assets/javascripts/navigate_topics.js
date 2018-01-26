$(document).ready(function() {
  //http://localhost:3000/topics/1
  var topicId = $('.js-topic').attr("data-id");
  if (topicId) {
    var topicsTriviasUrl = "/topics/" + topicId + ".json";

    $.getJSON(topicsTriviasUrl, function (data) {
      var topicName = data.topic.name;
      $('.add-topic').append("Topic: " + topicName);

      data.topic.trivias.forEach(function (trivia) {
        var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
        $(".js-trivias").append("<li><a href=" + triviaUrl + ">" + trivia.title + "</a></li><br/>");
      });
    });
  }
});
