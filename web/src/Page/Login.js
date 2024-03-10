import googleIcon from '../Assets/google.png'
import githubIcon from '../Assets/github.png'

export default function LoginPage(){
    return(
        <div className="py-12 px-4 bg-main h-screen">
           <div className="flex flex-col gap-1 justify-center">
                <div>
                    <span className="text-2xl font-semibold">Masuk ke</span>
                    <span className="text-2xl font-bold"> OWL.</span>
                </div>
                <p className="text-base">Silahkan masukkan informasi akun kamu.</p>
                <div className="flex flex-col gap-4 mt-4">
                    <input type="text" className="border-gray-400 border rounded-md py-1 px-3 placeholder-black placeholder-opacity-70" placeholder="Email"/>
                    <input type="password" className="border-gray-400 border rounded-md py-1 px-3 placeholder-black placeholder-opacity-70" placeholder="Password"/>
                    <div className="flex">
                        <input type="checkbox"/>
                        <p className="text-sm">&nbsp;Remember Me</p>
                    </div>
                </div>
                <button className="bg-orange-400 p-1 rounded-md font-light mt-2">Login</button>
                <hr className="my-4"/>
                <button className="text-blue font-light p-1 border border-blue-300 rounded-lg bg-white text-blue-300 flex justify-center items-center gap-2">
                    <img src={googleIcon} width={20} height={20}/>
                    Login With Google
                </button>
                <button className="text-blue font-light p-1 border border-blue-300 rounded-lg mt-2 bg-white text-blue-300 flex justify-center items-center gap-2">
                    <img src={githubIcon} width={20} height={20}/>Login With Github
                </button>
                
                <div className="text-center text-sm mt-1">
                    <span>Belum punya akun? </span>
                    <span className="text-blue-300">Daftar disini</span>
                </div>
           </div>
        </div>
    )
}
