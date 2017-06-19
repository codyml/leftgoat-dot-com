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
                test: /\.s?css$/,
                use: ExtractTextPlugin.extract({
                    use: [
                        { loader: 'css-loader', options: { sourceMap: true } },
                        { loader: 'sass-loader', options: { sourceMap: true } },
                    ],
                })
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
