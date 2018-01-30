# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      js file: triviaSessions_show.js, Active Model Serializer: trivia_session_serializer. Gets the current result and feedback by the player for the played trivia and renders it, along with the Next and Previous Links which navigates to the previous played trivias or the next played trivia, when player has navigated to the previous Trivias.

- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      js file: topics_index.js , Active Model Serializer: topic_serializer.rb. Gets all topics using getJSON and renders them to index page.

- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      js file: topics_show.js, Active Model Serializers: topic_serializer.rb & trivia_serializer.rb. Gets topic and related trivias(Topic has_many Trivias) using getJSON and renders to `topics/:id/show` page.

- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
      js file: topics_new.js. Hijack the submit event of the form, serializes the data, posts it to create using post() method and renders the data to `topics/new` page.

- [x] Translate JSON responses into js model objects.
      js file: topics_new.js. Creates a new Topic object on creation of every new topic.

- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
      js file: topics_new.js. Contains a Topic.Prototype method which returns the topic name along with the number of trivias in the topic.
      
Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
