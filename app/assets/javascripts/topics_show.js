// TODO Separate out data loading and template rendering via a callback


$(document).ready(function() {
  if($('body.topics-show-page').length === 0) {
    return;
  }
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
