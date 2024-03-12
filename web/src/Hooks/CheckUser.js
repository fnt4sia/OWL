import { createClient } from "@supabase/supabase-js";

const anonKey = process.env.REACT_APP_ANONKEY
const supabase = createClient('https://gkrzpruurzsarotxqmbc.supabase.co', process.env.REACT_APP_ANONKEY);

const checkJWT = async (session) => {
    try {
        // Get the access token and refresh token from the session
        const access_token = session.access_token;
        const refresh_token = session.refresh_token;

        // Set the session from the access token and refresh token
        const { user, error } = await supabase.auth.setSession({
            access_token
        });

        if(error) {
            localStorage.removeItem('session');
            window.location.href = '/login';
        }
    } catch (error) {
        localStorage.removeItem('session');
        window.location.href = '/login';
    }
}

const CheckUserLoggedIn = () => {
    let session = JSON.parse(localStorage.getItem('session'));

    if(session == null) {
        checkJWT(session);
    }
}

export default CheckUserLoggedIn;
