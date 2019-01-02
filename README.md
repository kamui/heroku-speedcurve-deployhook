# heroku-speedcurve-deployhook

Create Heroku deploys in SpeedCurve. This is a [sinatra](http://sinatrarb.com/) app that accepts Heroku formatted deploy post requests and triggers a SpeedCurve API request to create a deploy.


## Installation

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy) Click this button to create a new Heroku app.

Then, go to any other Heroku app and add a [Deploy Hook](https://elements.heroku.com/addons/deployhooks). Point the deploy hook url to:

```
https://[URL]/deploy/[SPEEDCURVE-API-KEY]/[SPEEDCURVE-SITE-ID]
```

- `[URL]` is the URL of the `heroku-speedcurve-deployhook` app you created
- `[SPEEDCURVE-API-KEY]` is the API Key on your [SpeedCurve Admin Team page](https://speedcurve.com/away/admin/teams/)
- `[SPEEDCURVE-SITE-ID]` is the number associated with the site you want to track in SpeedCurve. Go to [Setting > Sites](https://speedcurve.com/away/settings/#sites) click on the site you want to hook into and make note of the number in the URL (https://speedcurve.com/away/settings/site/[SPEEDCURVE-SITE-ID]/)

Add the Heroku Deploy add-on like this:

```bash
heroku addons:add deployhooks:http --url=https://your-heroku-speedcurve-deployhook-app.herokuapp.com/deploy/your-speedcurve-api-key/your-site-id
```

`heroku-speedcurve-deployhook` will, by default, wait 25 seconds to give your new app time to warm up. If you want to override this, you can set an environment variable named `DELAY_TIME`. The value is in seconds.

Now, SpeedCurve will create a deploy whenever your app is deployed on Heroku.
