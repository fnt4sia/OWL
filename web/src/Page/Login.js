export default function LoginPage(){
    return(
        <div className="h-screen p-8">
           <div className="flex flex-col gap-2 justify-center h-full">
                <p>Masuk ke OWL.</p>
                <p className="text-sm">Silahkan masukkan informasi akun kamu.</p>
                <input type="text" className="border-blue-400 border rounded-md py-1 px-3" placeholder="Email"/>
                <input type="password" className="border-blue-400 border rounded-md py-1 px-3" placeholder="Password"/>
                <div className="flex">
                    <input type="checkbox"/>
                    <p>Remember Me</p>
                </div>
                <button className="bg-orange-400 p-1 rounded-md font-light">Login</button>
                <hr className="my-2"/>
                <button className="text-blue font-light p-1 border border-blue-400 rounded-lg">Login With Google</button>
                <button className="text-blue font-light p-1 border border-blue-400 rounded-lg">Login With Facebook</button>
                <p>Belum punya akun ? Daftar disini</p>
           </div>
        </div>
    )
}
