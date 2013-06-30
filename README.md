rank_of_github
==============

simple of analyze github data , report as line chart

### requirement:

1. Rank of Github runs on Rails 4.0.0, please check your Rails version before you run this APP.
```
gem install rails --version=4.0.0
```

2. We use mongodb as the database, 
if you use MacOS X, you can easily install mongodb using [homebrew](http://mxcl.github.io/homebrew/)
```
brew install mongodb
```

3. We still need to fetch data manually, we will fix it as soon as possible
```
rails c
User.fetch_china_users
```

That's it, enjoy!




