# WithPartial
Adds a couple of helper methods allowing you to specify the partial to use when rendering a model.

## Usage

### `#with_partial`
Say you have a `Lesson` model. And for that model you have different ways you render that model based on the UI context, e.g. table, gallery, list, etc.

With standard Rails you can render that model, `<%= render lesson %>` but that resolves to the `lessons/_lesson.html.erb` partial.

With `#with_partial` you can specify a different partial you want to render, `<%= render model.with_partial('list_item') %>` would resolve to `lessons/_list_item.html.erb`

### `#with_context`

Continuing with the above `Lesson` example. Suppose your Rails application has two contexts within it, an end user focused context and an administrative context. For each of those contexts you have a slightly different UI for a `Lesson`, `lessons/_lesson.html.erb` and `admin/lessons/_lesson.html.erb`.

Again with standard Rails convention calling `render lesson` would result in your end user UI partial getting rendered, `lessons/_lesson.html.erb`.

With `#with_context` you can specify a context (or prefix) for the partial path, `render lesson.with_context('admin')` would resolve to `admin/lessons/_lesson.html.erb`.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'with_partial'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install with_partial
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
