const express = require('express');
const cors = require('cors');
const userRoute = require('./routes/user_route');

const app = express();

app.use(cors({
    origin: 'http://localhost:3001', // specify the origin
    credentials: true  // set credentials to true
}));

app.use(express.json());

app.use(userRoute);

port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log('Server is running on port', port);
});