const express = require('express');
const { getCourse, getTopics, getMaterials } = require('../controllers/courses');

const router = express.Router();

router.get('/courses', getCourse);

router.get('/topics/:courseID', getTopics);

router.get('/materials/:topicID', getMaterials);

module.exports = router;