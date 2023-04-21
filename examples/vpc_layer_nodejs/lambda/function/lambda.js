const get = require('simple-get')

exports.handler = function(event, context) {
    get('http://httpbin.org/headers', function(err, res) {
        if (err) throw err
        res.pipe(process.stdout)
    })
}

// exports.handler()
