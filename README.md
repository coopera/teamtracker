Team Tracker
==============

#Mongo tips
Now we're using MongoDB as our database.
For the ones that doesn't know, when you define a model you do not have a migration (because the data structure is much more flexible).
When you are creating a model (or updating its fields) you have to tell it in the model definition file.

#Starting the server
```shell
bundle exec foreman start
```
