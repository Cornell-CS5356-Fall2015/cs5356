Basic Active Record
===================

ActiveRecord is the default Ruby on Rails' Object Relational Mapper (ORM) and is the core of *Model Driven Design*. It encourages *fat* models and *skinny* controllers.

* Wraps a row of data
* Encapsulates database access
* Adds domain logic

It's important to note that, unlike Hibernate or JPA, ActiveRecord is a leaky abstraction, it just makes SQL things easier. But understanding the underlying complexity, the SQL underneath, is recommended.

A Rails App
-----------

First, we make a Rails app.

```
$ gem install rails
$ rails new arrr

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

A database table is a Ruby class.

``` ruby
class Widget < ActiveRecord::Base
  # class implementation
end
```

Rails has generators, we can just use that instead of creating a class by hand.

```
$ rails generate model widget name:string

      invoke  active_record
      create    db/migrate/20150930122044_create_widgets.rb
      create    app/models/widget.rb
      invoke    test_unit
      create      test/models/widget_test.rb
      create      test/fixtures/widgets.yml

```

Table names are plural and class names are singular. The table underneath the `Widget` class is `widgets`.

Attributes are inferred from *db/schema.rb*.

``` ruby
create_table :widgets do |t|
  t.string :name
  t.timestamps
end
```

If `Widget` has a `name`, the class `Widget` automatically gets a `name` field.

``` ruby
Widget.new.name
```

All tables have an Integer ID. The *widgets* table has a serial *id* field. This is not explicitly shown in the schema file but is automatically appended for every model.

``` ruby
Widget.new.id # id will be null because the database hasn't set the id yet.

Widget.create.id # id will be set upon successful creation.
```

Deployment and upgrade is taken care of with *migrations*.

Constraints
-----------

Widget should require a name.

```ruby
class Widget < ActiveRecord::Base
  validates_presence_of :name
end
```

But we also want to make sure it's required in the database with a constraint.

```
$ rails generate migration RequireNameForWidgets

      invoke  active_record
      create    db/migrate/20150930123008_require_name_for_widgets.rb

```

Edit the migration.

```ruby
class RequireNameForWidgets < ActiveRecord::Migration
  def change
    change_column_null :widgets, :name, false
  end
end
```

Saving Objects
--------------

* `save` and `save!`
* `update_attributes` and `update_attributes!`

As shown here:

``` ruby
widget = Widget.new
widget.save # attempts to save the widget, returns true or false
widget.errors # contains errors from save, if any
widget.save! # raises an exception instead
```

Querying
--------

* `Widget.first`
* `Widget.all`
* `Widget.find(1)`

Finders by field value are implemented using `method_missing`, eg. `find_by_name`.

The following can also be invoked by chaining the methods:

``` ruby
Widget.where("name = ?", name).limit(10).offset(10).order('name')
```

Associations
------------

* `belongs_to`
* `has_one`
* `has_many`
* `has_and_belongs_to_many` (HABTM)

Associations add methods to the class using *joins* at the SQL level. eg. `widget.gadgets`.

```
$ rails generate scaffold gadget name:string widget:belongs_to

      invoke  active_record
      create    db/migrate/20150930124015_create_gadgets.rb
      create    app/models/gadget.rb
      ...
```

Notice the [convention over configuration](http://en.wikipedia.org/wiki/Convention_over_configuration) approach to the foreign key name `widget_id`. Rails assumes the foreign key is the attribute labeled with the model name, `widget`, suffixed with `_id`. It also infers the table name from the symbol `:widgets`.

Using the Object Factory Fabricator for Testing
-----------------------------------------------

Often when working with request specs or integration tests, fake data is needed to set up your test scenario.
The gem [fabricator](http://fabricationgem.org/) or [factory_girl](https://github.com/thoughtbot/factory_girl) makes creating this fake data, and their associations, extremely straightforward.

```
gem 'fabrication'
```

Define a fabricator in `test/fabricators`.

``` ruby
Fabricator(:widget) do
  name 'a widget'
end
```

``` ruby
Fabricator(:gadget) do
  name 'a gadget'
end
```

Use in a test.

```ruby
require 'test_helper'

class GadgetTest < ActiveSupport::TestCase
  test "can be associated with a widget" do
    widget = Fabricate(:widget)
    gadget = Fabricate(:gadget, widget: widget)

    assert_equal Gadget.find(gadget.id).widget, widget
  end
end
```
