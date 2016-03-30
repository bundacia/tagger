# Tagger

A little API for tagging things.

## Starting The App

Starting the app should be simple. So keep things simple it's using sqlite, so
you shouldn't have to do too much to get things going:

```
bundle
bundle exec rails server
```

## Running The Tests

This app has cucumber tests for acceptance testing and rspec unit tests. You
can run everything in one go with this handy script:

```
script/run_tests
```

## Swagger Documentation

This API includes a [swagger](http://swagger.io/) [specification](/public/swagger.json) which has been used to autogenerate the interactive html documentation here:

[http://localhost:3000](http://localhost:3000)

## A Tour Of The Code

Most of this is pretty straight forward, but let me hilight a few parts of the codebase.

### /features
You'll find cucumber tests in the `features` directory, which also serve as decent documentation for how the API is intenmded to work. These are integration tests that interact with the app through rack.

### /spec
Unit tests can be found in the `spec` directory.

### /actions
I prefer not to have much of any business logic in ActiveRecord models (which I think should only really be responsible for persistence) or controllers (which I see as responsible for http-specific things like response codes and pulling params out of the request). To that end I often end up writing "action" objects to encapsulate business logic when a controller action would otherwise have to make multiple calls to ActiveRecord object methods. 

### A few naming decisions

#### `/tags` -> `/entities`
Once I got into this a little it seemed to me that the endpoints I was writing were realling modifying and returning entities, not tags, so I changes the route name.

#### `entity_id` and `external_id`
While it makes sense for clients of this API to refer to the entity identifier as `entity_id` that ends up being a terrible name for out `Entity` model as it's too easily confused with the primary key (`entity.id` vs `entity.entity_id`). I've seen this kind of thing cause a lot of confusion in the past. To avoid that confusion I called that id the `external_id` in the database. This means there are a few places where business logic has to map the public name of that attribute to our internal name, but I think that's preferable in the long run.
