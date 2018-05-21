
// CI test repository: node.js
// test: testing hello world server

const supertest = require ("supertest");
const should = require ("should");

// Testing server at localhost:4000
var request = supertest.agent ("http://localhost:4000");

describe (
    "Basic tests of app.js",
    () => {
        // Test #1
        it (
            "Checking 'http://localhost:4000' response",
            (done_cb) => {
                request
                    .get ("/")
                    .expect (200) 
                    .expect((res) => {
                        if ('Hello World' != res.text) throw new Error("Missing Hello World");
                    })
                    .end ((err, res) => {
                        if (err) throw err;
                        done_cb();
                    });
            });

    });
