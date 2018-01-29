$(document).ready(function(){
  $("form").submit(function(event){
    event.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/topics', values);
    posting.done(function (data){
      var topicId = data.topic.id;
      var topicName = data.topic.name;
      var newTopicsTriviaUrl = "/topics/" + topicId + "/trivias/new";
      $("#topicName").append("<a href=" + newTopicsTriviaUrl + ">" + topicName +"</a>" );
    });

  });
});
