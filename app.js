// CI test repository: node.js
// application: hello world server

const express = require('express');
const app = express();

app.get(
    '/',
    (req, res) => {
        res.send("Hello World 2");
    });
  

app.listen(4000);