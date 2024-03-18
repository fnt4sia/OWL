const express = require('express');
const { getCourse } = require('../controllers/courses');

const router = express.Router();

router.get('/courses', getCourse);

module.exports = router;