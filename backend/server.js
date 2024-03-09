const express = require('express');
const userRoute = require('./routes/user_route');

const app = express();

app.use(express.json());

app.use(userRoute);

port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log('Server is running on port', port);
});