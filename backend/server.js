const express = require('express');
const router = require('./routes/route');

const app = express();

app.use(express.json());

app.use(router);

port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log('Server is running on port 3000');
});