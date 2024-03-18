const supabase = require('../util/con_db');

const getCourse = async (req, res, next) => {
    try {
        const { data, error } = await supabase.from('courses').select('*');
        if (error) {
            res.status(400).json({
                status: 'failed',
                message: error.message
            });
            return;
        }

        if (data) {
            res.status(200).json({
                status: 'success',
                data: data
            });
        }

        throw new Error('An error occurred while fetching courses');

    } catch (error) {
        res.status(500).json({
            status: 'failed',
            message: error.message
        });
    }
}

module.exports = { getCourse };