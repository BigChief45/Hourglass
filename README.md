# Hourglass [![Build Status](https://travis-ci.org/BigChief45/Hourglass.svg?branch=master)](https://travis-ci.org/BigChief45/Hourglass)

Hourglass is my personal time tracking application, developed using Ruby on Rails. It integrates the [cal-heatmap](http://cal-heatmap.com/) JavaScript library to display time spent on each activity, similar to Github's contributions chart.

Even though I developed this application for personal use, you are free to register and use it yourself. Simply [access the application](http://hourglazz.herokuapp.com/users/sign_in) and register an account.

## Features

### Punchcards
A Punchcard represents an activity which you want to track the time (in hours) spent on it. An unlimited amount of punchcards can be added.

### Recording Time
For each punchcard, you can create records that specify the amount of time spent doing the activity, and a description of what was done. These records will be stored in the database, and will later be retrieved by Cal-HeatMap as JSON to display it in the calendar.

![Calendar Screenshot](https://raw.githubusercontent.com/BigChief45/Hourglass/master/screenshots/img1.jpeg)

## TODO

Many improvements can be made, and I am considering implementing them in the future. For example:

- ~~Search records based on description.~~
- Goals and Milestones implementation
- Improved user interface.