import supabase from '../../Middleware/Supabase';

const sendData = async (email, password) => {
    fetch('https://nodejsdeployowl.et.r.appspot.com/login', {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            'email': email,
            'password': password
        }),
        redirect: 'follow',
        credentials: 'same-origin'
    }).then((response) =>
        response.text()
    ).then(async (result) =>{
        const res = JSON.parse(result);
        const session = res.session

        const access_token = session.access_token;
        const refresh_token = session.refresh_token;

        const { error } = await supabase.auth.setSession({
            access_token,
            refresh_token
        });
        
        if (error) {
            throw error;
        }

        window.location.href = '/'
    }
    ).catch((err) => console.log(err))
}

const oauth = async (provider) => {
    fetch(`https://nodejsdeployowl.et.r.appspot.com/oauth/${provider}`, {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        redirect: 'follow',
        credentials: 'include'
    }).then((response) => 
        response.json()
    ).then((result) => {
        console.log(result);
        if (result.url) {
            window.location.href = result.url;
        }
    }).catch((err) => console.log(err))
}

export {sendData, oauth}