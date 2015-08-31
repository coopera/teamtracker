Team Tracker
==============
[![wercker status](https://app.wercker.com/status/32e748676ee90dc85397f3df20788c4e/m "wercker status")](https://app.wercker.com/project/bykey/32e748676ee90dc85397f3df20788c4e)

[![Code Climate](https://codeclimate.com/github/coopera/teamtracker/badges/gpa.svg)](https://codeclimate.com/github/coopera/teamtracker)

#Installing Dependencies

```shell
# Install ruby dependencies...
$ bundle install
# Install front-end dependencies...
$ rake bower:install
```

Reminder: you should've rails, bower and mondogb installed in your machine.

#Setting environment variables

If you are a coopera member, go to this url:

https://github.com/organizations/coopera/settings/applications/238108

And copy the ID and secret of the app and paste them at your .env file.

**DON'T COMMIT THIS FILE TO THE VCS**

For other users, create a new app here:

https://github.com/settings/applications/new

And do the same mentioned above.

Remember:

**DON'T COMMIT THE .ENV FILE TO THE VCS**

#Starting the server

Run a mongodb server:

```shell
$ mongod
```
And the app server:

```shell
$ bundle exec foreman start
```

#Contributing
_especially for coopera members_

To do

<!-- This app listen for events in Github and Slack, so your development server should be accessible through the internet to allow these services to authenticate a user (aka get an access token). Although this is hard with Github, because it needs to send a POST to a url in your machine, Slack makes it very easy with WebSockets. Fortunately, Github allows us to generate a access token in its dashboard. Finally, to contribute and execute this app locally, you need:

1. To generate a access token with at least a admin:repo_hook scope. (See https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
2. To save this token in a environment variable called GH_TT_DEV_TOKEN. You can use your .env. If so **DON'T COMMIT THIS FILE TO THE VCS** as it's a open source project, and people may steal your token and do bad things to your github account.

The magic happens at https://github.com/coopera/teamtracker/blob/master/app/controllers/login_controller.rb#L8-L11. -->
