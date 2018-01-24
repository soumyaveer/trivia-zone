$(document).ready(function(){
  var topicsUrl = "/topics" + ".json";
  $.get(topicsUrl, function(json){
    json.data.forEach(function(topic){
      var topicTriviasUrl = "/topics/" + topic.id + "/trivias";
      var topicName = topic.attributes.name;
      $(".js-topic").append("<a href=" + topicTriviasUrl + ">" +
        topicName + "</a>" + "<br/>");
    });
  });
});


