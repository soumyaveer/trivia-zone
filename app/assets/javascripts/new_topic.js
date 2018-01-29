function Topic(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
}

Topic.prototype.renderName = function(){
  // http://localhost:3000/topics/3/trivias/new
  var newTriviaUrl = "/topics/" + this.id + "/trivias/new";
  $("#topicName").append("<a href=" + newTriviaUrl + ">" + this.name + "</a>");
};

$(document).ready(function(){
  $("form").submit(function(event){
   event.preventDefault();
   var values = $(this).serialize();
   var posting = $.post("/topics", values);

   posting.done(function(data){
     var topic = new Topic(data.topic);
     topic.renderName();
   });
  });
});
