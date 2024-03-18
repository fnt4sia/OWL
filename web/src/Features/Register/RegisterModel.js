const sendData = async (email, password) => {
    fetch('https://nodejsdeployowl.et.r.appspot.com/register', {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            'email': email,
            'password': password
        }),
        redirect: 'follow'
    }).then((response) =>
        console.log(response.text())
    ).then(()=>{
        window.location.href = '/login'
    }).catch((err) => console.log(err))
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