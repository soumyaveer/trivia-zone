$(document).ready(function(){
  var topicsUrl = "/topics" + ".json";
  $.getJSON(topicsUrl, function(json){
    json.topics.forEach(function(topic){
      var topicsTriviasUrl = "/topics/" + topic.id;
      var topicName = topic.name;
      $(".js-topics").append("<li class='topic-display'><a href=" + topicsTriviasUrl + ">" + topicName + "</a></li>");
    });
  });
});
