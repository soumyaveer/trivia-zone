# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes).
      There are seven models - User, Topic, Trivia, Question, Answer, TriviaSession and AnswerTriviaSession.
      The has_many relationships are as follows:
       - User has_many Trivia(authored Trivias)
       - Topic has_many Trivia
       - Trivia has_many Questions
       - Question has_many Answers
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      The belongs_to relationships are as follows:
      - Trivia( authored trivia) belongs_to User
      - Trivia belongs to Topic
      - Question belongs_to Trivia
      - Answers belongs_to Question
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      There is one has_many through relationship:
       - User has_many Trivias through TriviaSession
       - Trivia has_many Users through TriviaSession
      There is also one has_and_belongs_to_many relationship:
      -TriviaSession has_and_belongs_to_many Answers
      - Answer has_and_belongs_to_many TriviaSession
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      User can submit his/her feedback for the played trivia.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      - User validates the presence of name and password and devise related validations - database_authenticatable, registarable, recoverable, rememberable, trackable, validatable, omniauthable, omniauth_providers: [:facebook]
      - Trivia validates presence and uniqueness of title
      - Topic validates presence and uniqueness of name
      - Question validates presence of description
      - Answer validates presence of description
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      - Trivia.search URL: localhost:3000/search=searched_term
      - TriviaSession.order_by_created_at URL:/trivia_zone
      - Trivia.authored_by URL: http://localhost:3000/topics/1/trivias
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
      - URL: http://localhost:3000/trivias/:id/trivia_sessions/new, Model: TriviaSession
- [x] Include signup (how e.g. Devise)
      - Devise
- [x] Include login (how e.g. Devise)
      - Devise
- [x] Include logout (how e.g. Devise)
      - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      - Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      - URL: /topics/1/trivias
      - URL: /trivias/1/trivia_sessions/13
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      - URL: /topics/3/trivias/new
      - URL: /trivias/1/trivia_sessions/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      - /topics/3/trivias/new
      - /users/sign_up

Confirm:
- [x] The application is pretty DRY
      - Reused html is extracted in partials
      - Reused methods are loaded using before_action in controllers
- [x] Limited logic in controllers
      - Controllers do not deal with data manipulation
- [x] Views use helper methods if appropriate
      - Views use helper methods like form_group_error_class_for, nav_status and nav_item_url
- [x] Views use partials if appropriate
      - Partials used: _homepage, _logged_in_user, _navbar, _topics, _form, _question_field, _answer_field
