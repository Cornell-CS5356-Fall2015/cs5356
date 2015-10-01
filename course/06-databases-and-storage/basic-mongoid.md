Basic MongoDB w/ Mongoid
========================

MongoDB is schemaless, so no migrations required.

A Rails App
-----------

First, we make a Rails app without ActiveRecord.

```
$ gem install rails
$ rails new mrrr --skip-active-record

      create
      create  README.rdoc
      create  Rakefile
      create  config.ru
      create  .gitignore
      create  Gemfile
      create  app

```

Basics
------

Add `mongoid` to Gemfile.

```
gem 'mongoid'
```

Generate a configuration.

```
$ rails generate mongoid:config
      create  config/mongoid.yml
```

A collection is a Ruby class.

``` ruby
class Widget
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_presence_of :name
end
```

All tables have a BSON ID.

```
> Widget.new.id
 => BSON::ObjectId('560bdcab568c322ae9000000')
```

The rest is almost identical to ActiveRecord.
