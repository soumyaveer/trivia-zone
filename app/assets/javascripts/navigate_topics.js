// //TODO:
// // #1
// // #2. Not able to convert authored trivias into JSON.
// // #3. Something got messed up in next, figure out
//
// $(document).ready(function(){
//   loadCurrentData();
//
//   $(".js-prev").on("click", function(){
//     loadPreviousData();
//   });
//
//   $(".js-next").on("click", function(){
//     loadNextData();
//   });
// });
//
// function loadCurrentData(){
//   var id = parseInt($(".js-prev").attr("data-id"));
//   var topicsUrl = "/topics/" + id + "/trivias.json";
//
//   $.getJSON(topicsUrl, function(data){
//     $(".js-topic").text("Topic: " +  data["topic"]["name"]);
//     data["topic"]["trivias"].forEach(function(trivia){
//       var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
//       $(".js-trivias").append("<li class='trivia-display'><a href=" + triviaUrl + ">" + trivia.title + "</a></li>");
//     });
//
//   });
// }
//
// function loadPreviousData() {
//   var prevId = parseInt($(".js-prev").attr("data-id")) - 1;
//   // http://localhost:3000/topics/1/trivias#
//   var prevTopicUrl = "/topics/" + prevId + "/trivias.json";
//   if (prevId > 0) {
//     $(".js-trivias").text(" ");
//
//     $.getJSON(prevTopicUrl, function(data){
//       $(".js-topic").text("Topic: " +  data["topic"]["name"]);
//
//       data["topic"]["trivias"].forEach(function(trivia){
//         var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
//         $(".js-trivias").append("<li class='trivia-display'><a href=" + triviaUrl + ">" + trivia.title + "</a></li>");
//         $(".js-prev").attr("data-id", data["topic"]["id"]);
//         $(".js-next").attr("data-id", prevId + 1);
//
//       });
//
//     });
//   }
//   else {
//     $(".js-prev").text("");
//   }
// }
//
// function loadNextData() {
//   var nextId = parseInt($(".js-prev").attr("data-id")) + 1;
//   var nextTopicUrl = "/topics/" + nextId + "/trivias.json";
//
//   if (nextId) {
//     $(".js-trivias").text(" ");
//
//     $.getJSON(nextTopicUrl, function(data){
//       $(".js-topic").text("Topic:" + data["topic"]["name"]);
//
//       data["topic"]["trivias"].forEach(function(trivia){
//         var triviaUrl = "/trivias/" + trivia.id + "/trivia_sessions/new";
//         $(".js-trivias").append("<li class='trivia-display'><a href=" + triviaUrl + ">" + trivia.title + "</a></li>");
//         $(".js-next").attr("data-id", data["topic"]["id"]);
//         $(".js-prev").attr("data-id", nextId - 1);
//
//       });
//
//     })
//
//   } else {
//     $(".js-next").text(""); // #1. this should not show the next if next is last
//   }
// }
