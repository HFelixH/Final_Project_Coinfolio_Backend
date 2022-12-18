# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'rest-client'

# puts 'Getting Crypto Data'

# def crypto_dataset
#   url = 'https://api.coingecko.com/api/v3/coins/markets'
#   cryptos = RestClient.get(url + '?vs_currency=AUD&order=market_cap_desc&per_page=100&page=1&sparkline=false')
#   crypto_array = JSON.parse(cryptos)
#   crypto_array.each do |crypto|
#     Crypto.create(
#       name: crypto['name'],
#       symbol: crypto['symbol'],
#       slug: crypto['slug'],
#       price: crypto['current_price'],
#       market_cap: crypto['market_cap'],
#       market_cap_rank: crypto['market_cap_rank'],
#       total_volume: crypto['total_volume'],
#       high_24h: crypto['high_24h'],
#       low_24h: crypto['low_24h'],
#       price_change_24h: crypto['price_change_24h'],
#       price_change_percentage_24h: crypto['price_change_percentage_24h'],
#       market_cap_change_24h: crypto['market_cap_change_24h'],
#       market_cap_change_percentage_24h: crypto['market_cap_change_percentage_24h'],
#       circulating_supply: crypto['circulating_supply'],
#       total_supply: crypto['total_supply'],
#       max_supply: crypto['max_supply'],
#       ath: crypto['ath'],
#       ath_change_percentage: crypto['ath_change_percentage'],
#       ath_date: crypto['ath_date'],
#       atl: crypto['atl'],
#       atl_change_percentage: crypto['atl_change_percentage'],
#       atl_date: crypto['atl_date'],
#       roi: crypto['roi'],
#       last_updated: crypto['last_updated']
#     )
#   end
# end

# crypto_dataset
# puts 'Crypto Data Seeded'

User.create(username: 'tester', email: 'tester@test.com', password: 'password')