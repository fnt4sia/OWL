import { createClient } from "@supabase/supabase-js";

const anonKey = process.env.REACT_APP_ANONKEY
const supabase = createClient('https://gkrzpruurzsarotxqmbc.supabase.co', process.env.REACT_APP_ANONKEY);


const CheckUserLoggedIn = async () => {
    try {
        // Get the user session
        const { data: { user: userSession } } = await supabase.auth.getUser();
        if (userSession) {
            return;
        }

        // if no user, check if there is a session in the local storage and set it
        const session = JSON.parse(localStorage.getItem('session'));
        const access_token = session.access_token;
        const refresh_token = session.refresh_token;

        const { user, error } = await supabase.auth.setSession({
            access_token,
            refresh_token
        });
        
        if (error) {
            throw error;
        }

        localStorage.removeItem('session');
        window.location.href = '/login';

    } catch (error) {
        localStorage.removeItem('session');
        window.location.href = '/login';
    }
}

export default CheckUserLoggedIn;
