import supabase from '../Middleware/Supabase';

const CheckUserLoggedIn = async () => {
    try {
        const { data: { user: userSession } } = await supabase.auth.getUser();
        if (userSession) {
            return;
        }

        throw new Error('No user session');
    } catch (error) {
        window.location.href = '/login';
    }
}

export default CheckUserLoggedIn;
