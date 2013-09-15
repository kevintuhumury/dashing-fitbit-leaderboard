# Dashing leaderboard widget for FITBIT®

Fitbit Leaderboard widget for [Dashing](http://shopify.github.com/dashing), which uses the [Fitgem](https://github.com/whazzmaster/fitgem) gem to retrieve information from the [Fitbit API](https://dev.fitbit.com/). It displays the leaderboard of you and your friends. It calculates the top 5 (or less if you don't have more than 5 contacts in your list) of the past 7 days including today, so the ranking changes constantly.

An example of the widget can be viewed [below](https://github.com/kevintuhumury/dashing-fitbit-leaderboard#preview). If you want show your own statistics, you might want to checkout the [Fitbit](https://github.com/kevintuhumury/dashing-fitbit) widget.

## Dependencies

[Fitgem](https://github.com/whazzmaster/fitgem) is a dependency of the Fitbit Leaderboard widget. So, add `fitgem` to the Gemfile of your Dashing dashboard:

```ruby
gem "fitgem"
```

This widget has been [Haml](http://haml.info/)ified (we're using a HAML template in the `/widgets/fitbit` directory instead of an HTML template), so besides the above you'll also need to add `haml` to the Gemfile (if you haven't already):

```ruby
gem "haml"
```

and require it in your `config.ru` file right below the require of dashing itself. So the first few lines of your `config.ru` should look something like the following:

```ruby
require 'dashing'
require 'haml'

configure do
...
```

Now run `bundle install`.

## Authorization

If you're already using the [Fitbit](https://github.com/kevintuhumury/dashing-fitbit) widget, you've already authenticated with the Fitbit API. Therefor you can skip this part of the README and continue with the '[Usage](https://github.com/kevintuhumury/dashing-fitbit-leaderboard#usage)' section. If not, keep on reading.

To actually use the widget on your own Dashboard, you'll have to [request](https://dev.fitbit.com/apps/new) an API key and shared secret from Fitbit. The steps below will take you through the entire process.

1. Create a file called `.fitbit.yml` in the root of your Dashboard with the content below and add the `consumer_key` and `consumer_secret` you've received from the [Fitbit site](https://dev.fitbit.com/apps/new).

  ```yaml
  oauth:
      consumer_key: "YOUR_KEY"
      consumer_secret: "YOUR_SECRET"
  ```

2. Copy the `/lib/fitbit_authorizer.rb` file into the root of your Dashboard and enable it for execution by running the following on the command line:

  ```bash
  chmod +x fitbit_authorizer.rb
  ```

3. Now call that script by entering the following on the command line:

  ```bash
  ./fitbit_authorizer.rb
  ```

  The script will ask you to copy and paste the shown URL into your browser. You'll have to login to Fitbit.com and authorize this widget to access your data. Once you've done that, you'll receive a PIN code from Fitbit which needs to be copied and pasted back on the command line.

  After pasting that code and hitting `<Enter>` the script will add a `token`, `secret` and `user_id` to the `.fitbit.yml` file.

  The above should only be done once, so basically you could now remove the `fitbit_authorizer.rb` file and move on to the next section (Usage). Just make sure the `.fitbit.yml` file looks something like the following:

  ```yaml
  oauth:
      consumer_key: "YOUR_KEY"
      consumer_secret: "YOUR_SECRET"
      token: "TOKEN"
      secret: "SECRET"
      user_id: "USER_ID"
  ```

## Usage

To use this widget, copy `fitbit_leaderboard.coffee`, `fitbit_leaderboard.haml` and `fitbit_leaderboard.sass` into the `/widgets/fitbit_leaderboard` directory of your dashboard. Copy the `fitbit.png` image to the `/assets/images/fitbit` directory. Put the `/jobs/fitbit_leaderboard.rb` file in the `/jobs` folder and the `/lib/fitbit.rb` file into the `/lib` directory. If there isn't one yet, create it.

When you've already added the [Fitbit](https://github.com/kevintuhumury/dashing-fitbit) widget, you already have the `/lib/fitbit.rb` and `/assets/images/fitbit/fitbit.png` file. Don't worry about that, just replace them. They should be exactly the same.

To include the widget on your dashboard, add the following snippet to the dashboard layout file:

```ruby
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="fitbit_leaderboard" data-view="FitbitLeaderboard"></div>
</li>
```
When you're using a Hamlified dashboard layout (hey, you're already using a Hamlified widget, so why not Hamlify your dashboard layout?), you could also do the following:

```ruby
%li(data-row="1" data-col="1" data-sizex="1" data-sizey="1")
  %div(data-id="fitbit_leaderboard" data-view="FitbitLeaderboard")
```

Now, if you haven't already, authorize the widget over at the Fitbit website as described above. Once that's done, you should be able to start using it!

## Copyright

Copyright 2013 Kevin Tuhumury. Released under the MIT License. Fitbit is a registered trademark and service mark of Fitbit, Inc. The Dashing widget is designed for use with the Fitbit platform. This product is not put out by Fitbit, and Fitbit does not service or warrant the functionality of this product.
