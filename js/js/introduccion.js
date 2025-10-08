var ul =document.getElementById("lista")
let url = "https://thesimpsonsapi.com/api/"
let arr_original = []
var lis = ""

var getLista = (page)=>{
fetch(url+"characters?page="+page).then(response=>{
    if(!response.ok){
        console.log("Error en la red")
    }
    return response.json()
}).then(data=>{
    console.log("Datos del personaje: ", data)
    data.results.forEach(personaje=>{
        arr_original.push({
            personaje:personaje,
            datos:null
        })
        lis+=`
        <li>
            <img src="https://cdn.thesimpsonsapi.com/200${personaje.portrait_path}" width="200px" />
            <h2>${personaje.name}</h2>
        </li>`
    })
    ul.innerHTML = lis 
    console.log("ARREGLO FINAL",arr_original)
})
}
for(let i=1;i<=5;i++){
    getLista(i)
}