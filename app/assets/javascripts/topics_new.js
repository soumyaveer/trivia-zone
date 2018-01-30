function Topic(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
}

Topic.prototype.getNameWithTriviaCount = function(){
  let triviasLength = this.trivias ? this.trivias.length : 0;
  return `${this.name} (${triviasLength})`;
};

$(document).ready(function(){
  if($('body.topics-new-page').length === 0) {
    return;
  }

  $("form").submit(function(event){
   event.preventDefault();
   let values = $(this).serialize();
   let posting = $.post("/topics", values);

   posting.done(function(data){
     let topic = new Topic(data.topic);
     let topicDisplay = topic.getNameWithTriviaCount();
     let newTriviaUrl = `/topics/${topic.id}/trivias/new`;
     $('#topicName').append("<a href=" + newTriviaUrl + ">" + topicDisplay + "</a>");
   });
   $('#topic_name').val(' ');
  });
});
