# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails.

This application allows users to create accounts, add items to cart and place orders by using Stripe integration. Admin can add and modify products and categories.

## Final Product

!["Main Page"](https://github.com/yasu71/jungle-rails/blob/master/docs/screenshot1.jpg?raw=true)

!["Admin Page: all products"](https://github.com/yasu71/jungle-rails/blob/master/docs/screenshot2.jpg?raw=true)

!["Admin Page: add a new product"](https://github.com/yasu71/jungle-rails/blob/master/docs/screenshot3.jpg?raw=true)

!["Order Completed Page"](https://github.com/yasu71/jungle-rails/blob/master/docs/screenshot4.jpg?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Open `localhost:3000` in your browser to open the application

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Tests
* Rspec-rails
* Capybara

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
