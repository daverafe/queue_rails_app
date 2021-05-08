# README

# Queue Rails App
This is an online media recommendation app. For now it's focused on TV shows and movies, but may expand to other media in the future. You can search for a user, then recommend a TV show or movie that they should watch. When that user logs in they will see the recommendation you've made for them.  

## Installing / Getting started

You'll need to run a few commands in your terminal to get this up and running
```shell
git clone git@github.com:daverafe/queue_rails_app.git
cd queue_rails_app
bundle install
rails s 
```
Open a browser tab and type: localhost:3000

If you follow the above steps you should be on the sites landing page.

*If you want to use the third party autherization that's available, you're going to have to get your own Client ID and Secret from google, and then put that into a .env file.*


## Developing

This project was built with ruby on rails. 

```shell
git clone git@github.com:daverafe/queue_rails_app.git
cd queue_rails_app
bundle install
code . 
```

This is going to give you access to the repository, install any dependencies you need, and open the project in your VS code. 

*If you want to use the third party autherization that's available, you're going to have to get your own Client ID and Secret from google, and then put that into a .env file.*


## Features

In this project you're able to search other users who are signed up for the app.
You can recommend TV shows or movies to any user who is signed up for the app.
Users have a profile page where they can see recommendations other users have made for them. 
You can also search through all of the TV shows and movies in the projects database, and create any new ones you want to add.
There is also a custom landing page that has all the most recent recommendations between all users of the app. 
You can also login with google as a third party account.(special instructions under installing/getting started)

## Contributing

If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome.

## Links

- Repository: https://github.com/daverafe/queue_rails_app

