$(document).ready(function(){
  var topicsUrl = "/topics" + ".json";
  $.getJSON(topicsUrl, function(json){
    json.data.forEach(function(topic){
      var topicsTriviasUrl = "/topics/" + topic.id + "/trivias";
      var topicName = topic.attributes.name;
      $(".js-topics").append("<li class='topic-display'><a href=" + topicsTriviasUrl + ">" + topicName + "</a></li>");
    });
  });
});


