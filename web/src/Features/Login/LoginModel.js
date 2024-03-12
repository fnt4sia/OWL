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
    ).then((result) =>{
        const res = JSON.parse(result);
        const session = JSON.stringify(res.session)
        localStorage.setItem('session', session)
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