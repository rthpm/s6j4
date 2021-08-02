# THP: S6J1

This is a new iteration of The Gossip Project on Rails with a full MVC
structure.


## Dependencies

- ruby 2.7.4
- rails 5.2.6
- postgresql and its dependencies


## Get started

Run `bundle install` as usual and generate the database with `rails db:create`.
Now, you just have to populate the database and navigate the project on you
browser:

```
; rails db:migrate
; rails db:seed
; rails server
```


## Secret page

Just go to [localhost:3000/welcome/something](localhost:3000/welcome/something)
for a nice greet.
