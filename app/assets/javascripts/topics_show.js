function renderTopicTrivias(topic){
  $('.add-topic').text(`Topic: ${topic.name}`);
  topic.trivias.forEach(function (trivia) {
    let triviaUrl = `/trivias/${trivia.id}/trivia_sessions/new`;
    let template = `<li>
                       <a href="${triviaUrl}">${trivia.title}</a>
                     </li><br/>`;
    $(".js-trivias").append(template);
  });
}

$(document).ready(() => {
  if($('body.topics-show-page').length === 0) {
    return;
  }

  let topicId = $('.js-topic').data('id');
  let topicsTriviasUrl = `/topics/${topicId}.json`;

  $.getJSON(topicsTriviasUrl, function (data) {
    renderTopicTrivias(data.topic);
    });
});
