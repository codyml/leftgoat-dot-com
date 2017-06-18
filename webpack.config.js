const ExtractTextPlugin = require("extract-text-webpack-plugin")

module.exports = {

    entry: './static-src/main.js',

    output: {

        path: './static-dist',
        publicPath: '/static/',
        filename: 'bundle.js',

    },

    module: {

        loaders: [

            { test: /\.js$/, exclude: /node_modules/, loader: 'babel' },
            { test: /\.scss$/, loader: ExtractTextPlugin.extract([ 'css?minimize', 'sass' ]) },
            { test: /\.(jpg|png|svg)$/, loader: 'url?limit=25000' },
            { test: /\.otf$/, loader: 'url?limit=25000&mimetype=application/octet-stream' },

        ],

    },

    plugins: [

        new ExtractTextPlugin("styles.css"),

    ],

}
