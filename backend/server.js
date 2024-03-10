const express = require('express');
const cors = require('cors');
const userRoute = require('./routes/user_route');

const app = express({
    exposedHeaders: ['set-cookie']
});

app.set('trust proxy', 1);

app.use(cors());

app.use(express.json());

app.use(userRoute);

port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log('Server is running on port', port);
});