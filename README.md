Rank of Github
==============

simple of analyze github data , report as line chart

### Requirement:

Rank of Github runs on Rails 4.0.0, please check your Rails version before you run this APP.
Also you can install rails 4.0.0 by runing following commands.

```
gem install rails --version=4.0.0
```

We use mongodb as the database, 
if you use Mac OSX, you can easily install mongodb using [homebrew](http://mxcl.github.io/homebrew/).

```
brew install mongodb
mongod
```

We still need to fetch data manually, and we will fix it as soon as possible.

```
rails c
User.fetch_china_users
```

That's it, enjoy!




