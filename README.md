# Heroku-SpeedCurve deploy hook

Track Heroku deploys in SpeedCurve


## Installation

Push this button [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy) to create a new Heroku app.

Finally, go to any other Heroku app for which you wish to notify SpeedCurve when they're deployed, and add an HTTP deploy hook pointing to `https://[URL]/deploy/[your SpeedCurve API key]`, where `[URL]` is the URL of the Heroku app you just created, like so:

```shell
heroku addons:add deployhooks:http --url=https://your-speedcurve-heroku-app.herokuapp.com/deploy/abc123whatever
```

SpeedCurve will get notified whenever the app is deployed, and start a batch of tests.