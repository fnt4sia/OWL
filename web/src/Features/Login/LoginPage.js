import googleIcon from '../../Assets/google.png'
import githubIcon from '../../Assets/github.png'
import image from '../../Assets/login.png'
import { useState, useEffect } from 'react'
import {sendData, oauth} from './LoginModel'
import CheckUserLoggedIn  from "../../Hooks/CheckUser"


export default function LoginPage(){
    
    const[email, setEmail] = useState('');
    const[password, setPassword] = useState('');
    // const[loginResponse, setResponse] = useState()

    const onChangeEmail = (e) => {
        setEmail(e.target.value)
    } 
    const onChangePassword = (e) => {
        setPassword(e.target.value)
    }

    useEffect(() => {
        const check = async () => {
            const isLoggedIn = await CheckUserLoggedIn();
            if (isLoggedIn) {
                window.location.href = '/';
            }
        }
        check();
    }, [])


    const  login = async (email, password) => {
        let res = await sendData(email, password)
        console.log(res)
        // setResponse(sendData(email, password));
    }

    // useEffect(()=>{
    //     console.log(loginResponse)
    //     // if(loginResponse.)
    // },[setResponse])


    return(
        <div className="py-12 px-4 lg:py-20 lg:px-8 bg-OWL-base h-screen md:flex md:justify-center md:items-center ">
            <div className='hidden md:block'>
                <img src={image} alt='test' className='md:max-w-sm lg:max-w-md lg:max-h-full'/>
            </div>
           <div className="flex flex-col gap-1 lg:gap-2 justify-center md:justify-start w-full md:w-1/2 ">
                <div>
                    <span className="text-2xl lg:text-4xl font-semibold">Masuk ke</span>
                    <span className="text-2xl lg:text-4xl font-bold"> OWL.</span>
                </div>
                <p className="text-base lg:text-lg ">Silahkan masukkan informasi akun kamu.</p>
                <div className="flex flex-col gap-4 mt-4">
                    <input type="text" value={email} onChange={onChangeEmail} className="border-gray-400 border rounded-md py-1 lg:py-2 px-3 placeholder-black placeholder-opacity-70" placeholder="Email"/>
                    <input type="password" password={password} onChange={onChangePassword} className="border-gray-400 border rounded-md py-1 lg:py-2 px-3 placeholder-black placeholder-opacity-70" placeholder="Password"/>
                    <div className="flex">
                        <input type="checkbox"/>
                        <p className="text-sm">&nbsp;Remember Me</p>
                    </div>
                </div>
                <button onClick={() => login(email, password)} className="bg-orange-400 p-1 rounded-md font-light mt-2 lg:mt-4 lg:text-lg">Login</button>
                <hr className="my-4"/>
                <button 
                    className="text-blue font-light p-1 lg:p-2 border border-blue-300 rounded-lg bg-white text-blue-300 flex justify-center items-center gap-2" 
                    onClick={() => oauth("google")}
                >
                    <img alt='gugel'src={googleIcon} width={20} height={20}/>
                    Login With Google
                </button>
                <button 
                    className="text-blue font-light p-1 lg:p-2 border border-blue-300 rounded-lg mt-2 bg-white text-blue-300 flex justify-center items-center gap-2" 
                    onClick={() => oauth("github")}
                >
                    <img alt='github' src={githubIcon} width={20} height={20}/>Login With Github
                </button>
                
                <div className="text-center text-sm mt-2">
                    <span>Belum punya akun? </span>
                    <a href='/register'>
                        <span className="text-blue-300">Daftar disini</span>
                    </a>
                </div>
           </div>
        </div>
    )
}
