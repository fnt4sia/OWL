import illustration from "../../Assets/Illustration.png"
import SearchBar from "../../Components/SearchBar"

export default function TestPage(){
    return (
        <>
            <div className="bg-OWL-base p-8">
                <div>
                    <img src={illustration} className="mb-8 w-72 mx-auto"/>
                    <h3 className="text-xl font-bold pl-1">Eksplorasi Pembelajaran Terbaik di Dunia Digital!</h3>
                    <p className="text-sm mt-4 pl-1">Buka Potensi Penuh Keterampilan Digital dengan Kursus Tentang Pengembangan Web, Mobile, Desain UI/UX, dan Manajemen Proyek.</p>
                    <div className="mt-6">
                        <SearchBar/>
                    </div>
                </div>
                <div className="bg-OWL-dark-blue flex flex-col gap-8 text-white p-10 mt-10 rounded-2xl">
                    <div className="flex flex-col gap-3">
                        <h2>
                            <span className="font-semibold">OWL.</span>
                            <br/>
                            Program
                        </h2>
                        <p className="text-xs">Dirancang untuk mengembangkan keterampilan Anda di dunia digital</p>
                    </div>
                    <div className="flex flex-col gap-5">
                        <div className="flex gap-3 justify-between items-center">
                            <h2 className="text-sm">Creative Thinking</h2>
                            <p className="text-xs text-nowrap">Learn more +</p>
                        </div>
                        <div className="flex gap-3 justify-between items-center">
                            <h2 className="text-sm">Gamification</h2>
                            <p className="text-xs text-nowrap">Learn more +</p>
                        </div>
                        <div className="flex gap-3 justify-between items-center">
                            <h2 className="text-sm">Interactive Learning</h2>
                            <p className="text-xs text-nowrap">Learn more +</p>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}