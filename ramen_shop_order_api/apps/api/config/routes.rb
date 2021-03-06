# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/items', to: 'items#index'
post '/order_slip', to: 'order_slip#create'
post '/order_slip/add_item', to: 'order_slip#add_item'
get '/order_slip/calculate_accounting_price', to: 'order_slip#calculate_accounting_price'
