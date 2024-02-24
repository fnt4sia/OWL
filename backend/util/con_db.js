const supabase = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASEURL;
const supabaseKey = process.env.SUPABASEKEY;

const database = supabase.createClient(supabaseUrl, supabaseKey);

module.exports = database;