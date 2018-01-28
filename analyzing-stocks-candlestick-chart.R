library('quantmod')

# get bitcoin and amazon
loadSymbols(c('BTCUSD=X', "AMZN"))

ls()

# plot AMZN
plot(AMZN)

# plot bitcoin
plot(`BTCUSD=X`)

# candlechart bitcoin
chartSeries(`BTCUSD=X`, subset='last 3 months')
addBBands()

# candle chart AMZN
chartSeries(AMZN, subset = 'last 3 months')
addBBands()
