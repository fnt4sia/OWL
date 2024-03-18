// const registerEmail = async (email, password) => {
//     let response = await fetch('https://nodejsdeployowl.et.r.appspot.com/register', {
//         method: 'POST',
//         headers: {"Content-Type": "application/json"},
//         body: JSON.stringify({
//             'email': email,
//             'password': password
//         }),
//         redirect: 'follow'
//     }).then((response) =>
//         console.log(response.text())
//     ).then(()=>{
//         window.location.href = '/login'
//     }).catch((err) => console.log(err))
// }

const registerEmail = async (email, password) => {
    let response = await fetch('https://nodejsdeployowl.et.r.appspot.com/register', {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            'email': email,
            'password': password
        }),
        redirect: 'follow'
    })

    let responseBody = await response.json()
    console.log(responseBody)
    return responseBody
}

export {registerEmail}