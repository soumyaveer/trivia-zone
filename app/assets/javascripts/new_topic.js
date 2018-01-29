function Topic(attributes) {
  console.log(attributes);
  this.id = attributes.id;
  this.name = attributes.name;
}

Topic.prototype.renderName = function(){
  var newTopicsTriviaUrl = "/topics/" + this.id + "/trivias/new";
  $("#topicName").append("<a href=" + newTopicsTriviaUrl + ">" + this.name +"</a>" );
};


$(document).ready(function(){
  $("form #js-form").submit(function(event){
    event.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/topics', values);
    posting.done(function (data){
      var topic = new Topic(data.topic);
      topic.renderName();
    });

  });
});
