$(document).ready(function(){
  $(".js-prev").on("click", function(){
    var prevId = parseInt($(".js-prev").attr("data-id")) - 1;
    // http://localhost:3000/topics/1/trivias#
    var prevTopicUrl = "/topics/" + prevId + "/trivias.json";
     if (prevId > 0) {
       $(".js-trivias").text(" ");

       $.getJSON(prevTopicUrl, function(data){
         $(".js-topic").text("Topic: " +  data["topic"]["name"]);

         data["topic"]["trivias"].forEach(function(trivia){
           var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
           $(".js-trivias").append("<li class='trivia-display'><a href=" + triviaUrl + ">" + trivia.title + "</a></li>");
           $(".js-prev").attr("data-id", data["topic"]["id"]);
         });

       });
     }
     else {
       $(".js-prev").text("");
     }
  });

  $(".js-next").on("click", function(){
    var nextId = parseInt($(".js-prev").attr("data-id")) + 1;
    var nextTopicUrl = "/topics/" + nextId + "/trivias.json";

    if (nextId) {
      $(".js-trivias").text(" ");

      $.getJSON(nextTopicUrl, function(data){
        $(".js-topic").text("Topic:" + data["topic"]["name"]);

        data["topic"]["trivias"].forEach(function(trivia){
          var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
          $(".js-trivias").append("<li class='trivia-display'><a href=" + triviaUrl + ">" + trivia.title + "</a></li>");
          $(".js-next").attr("data-id", data["topic"]["id"]);
        });

      });

    } else {
      $(".js-next").text("");
    }
  });
});
