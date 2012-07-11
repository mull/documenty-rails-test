# "Barebones" application to test the documenty-rails gem
Howto:
```
  git clone https://github.com/pushly/documenty-rails-test
  cd documenty-rails-test
  bundle install
```
You will be asked for your login credentials when running bundle install
as the documenty & documenty-rails gems are only available at pushly/ at
this point.

After that is done (use these details):
```
  # eml/barebones rails g documenty:install
  I need some basic information to create your API documentation.
  API name: push.ly JSON REST API
  API version: 1
  API url: http://0.0.0.0:3000/api
  API controller namespace (eg. api/v1): api/business/v1 
    create  config/documenty.yml
```

Then start your rails server in another tab and then generate documenty:
```
  rails s
  # Switch tab
  rails g documenty && open http://0.0.0.0:3000/api
```