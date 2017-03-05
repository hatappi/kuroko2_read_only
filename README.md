# Kuroko2ReadOnly

Add User read-only function to kuroko2

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kuroko2_read_only'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kuroko2_read_only

## Usage

- Please install [cookpad/kuroko2#installation](https://github.com/cookpad/kuroko2#installation) first .
- add gem to your Gemfile
- generate kuroko2_read_only file and migrate

  ```
  $ bundle exec rails generate kuroko2_read_only:install
  $ bundle exec rake db:migrate
  ```
- add `Kuroko2ReadOnly::RequestHandler` to controller extensions

  ```yaml
  extentions:
    controller:
      - '::Kuroko2ReadOnly::RequestHandler'
  ```
- If the user's read_only is true, `Kuroko2ReadOnly::AccessDenied` occur when other than get.

### Read only setting
- mount Kuroko2ReadOnly::Engine path to your routes.rb

  ```rb
  Rails.application.routes.draw do
    ~~
    mount Kuroko2ReadOnly::Engine => "/kuroko2_read_only"
    ~~
  end
  ```

- access `/kuroko2_read_only/settings`


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hatappi/kuroko2_read_only. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

