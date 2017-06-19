const path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {

    entry: './static-src/main.js',

    output: {

        path: path.resolve(__dirname, 'leftgoat-custom-theme/static'),
        publicPath: '/wp-content/themes/leftgoat-custom-theme/static/',
        filename: 'script.js',

    },

    module: {
        
        rules: [
            
            {
                test: /\.css$/,
                use: ExtractTextPlugin.extract({
                    use: [
                        {
                            loader: 'css-loader',
                            options: { importLoaders: 1 },
                        },
                        'postcss-loader',
                    ],
                }),
            },
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
            },
            { test: /\.(svg|woff2?|ttf|eot|png|otf)/, loader: 'file-loader' },

        ],
    
    },
    
    plugins: [
        new ExtractTextPlugin('styles.css'),
    ],

}
