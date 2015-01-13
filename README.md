ProblemHunt - [ ![Codeship Status for nsarno/problemhunt-api](https://codeship.com/projects/1662a330-5b07-0132-d1f8-022e5ac315ca/status)](https://codeship.com/projects/50454) [![Code Climate](https://codeclimate.com/github/nsarno/problemhunt-api/badges/gpa.svg)](https://codeclimate.com/github/nsarno/problemhunt-api) [![Test Coverage](https://codeclimate.com/github/nsarno/problemhunt-api/badges/coverage.svg)](https://codeclimate.com/github/nsarno/problemhunt-api)
============

Discover and prioritize problems impacting large populations.

This project has originated @startupbus Europe 2014 and made it to the finales.

## Description

This is the ProblemHunt API. It's used by both the ProblemHunt for iOS and the ProblemHunt AngularJS app.
It's using [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) to allow the API to be a totally separated entity from the frontend.

- The API is accessible at https://problemhunt.herokuapp.com/
- An alpha version of the app is accessible at https://problemhunt.firebaseapp.com/

## Technical Stack

- Ruby on Rails with [rails-api](https://github.com/rails-api/rails-api)
- PostgreSQL
- Heroku
- Codeship for continuous deployement with Github & Heroku
- RSpec and FactoryGirl for testing
- [CORS](http://enable-cors.org/) enabled with [rack-cors](https://github.com/cyu/rack-cors) & [jwt](http://jwt.io/)
- Active Model Serializer for JSON generation
- Code Climate for automated code review
