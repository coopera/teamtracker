Team Tracker
==============

#Starting the server
```shell
bundle exec foreman start
```

#Contributing
_especially for coopera members_

This app listen for events in Github and Slack, so your development server should be accessible through the internet to allow these services to authenticate a user (aka get an access token). Although this is hard with Github, because it needs to send a POST to a url in your machine, Slack makes it very easy with WebSockets. Fortunately, Github allows us to generate a access token in its dashboard. Finally, to contribute and execute this app locally, you need:

1. To generate a access token with at least a admin:repo_hook scope. (See https://help.github.com/articles/creating-an-access-token-for-command-line-use/)
2. To save this token in a environment variable called GH_TT_DEV_TOKEN. You can use your .env. If so **DON'T COMMIT THIS FILE TO THE VCS** as it's a open source project, and people may steal your token and do bad things to your github account.

The magic happens at https://github.com/coopera/teamtracker/blob/master/app/controllers/login_controller.rb#L8-L11.

##Slack
To make a slack integration, go to `/listeners/slack/new` and put your api token. To know [how to get the token](https://api.slack.com/web) click on the link
