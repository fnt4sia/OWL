export default function CheckUserLoggedIn(){
    let jwt = localStorage.getItem('session');
    if(jwt == null)
        window.location.href = '/login';
}
