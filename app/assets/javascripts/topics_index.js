$(document).ready(() => {
  if($('body.topics-index-page').length === 0) {
    return;
  }

  const topicsURL = "/topics.json";

  $.getJSON(topicsURL, (json) => {
    json.topics.forEach((topic) => {
      let topicsTriviasUrl = "/topics/" + topic.id;
      let topicName = topic.name;

      let template = `<li class='topic-display'>
                       <a href="${topicsTriviasUrl}">${topicName}</a>
                     </li>`;

      $(".js-topics").append(template);
    });
  });
});
