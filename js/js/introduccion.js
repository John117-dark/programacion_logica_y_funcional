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
setTimeout(()=>{
    document.getElementById("preloader").style.display = "none"
},1000)
const imprimir = (arr)=>{
    var todo = "";
    arr.forEach(item=>{
        todo += `
        <li>
            <img src="https://cdn.thesimpsonsapi.com/200${item.personaje.portrait_path}" width="200px" />
            <h2>${item.personaje.name}</h2>
        </li>`
    })
    ul.innerHTML = todo
}
document.querySelector("#mostrarTodo").addEventListener('click',(evt)=>{
    evt.preventDefault()
    imprimir(arr_original)
})
//Edad menor que 18
document.querySelector("#linkEdad").addEventListener('click',(evt)=>{
    //Evitar recarga
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.age < 18)
    console.log("EDAD",res)
    imprimir(res)
})
/* 
1 Moridos
2 Menores de edad
3 Promedio de edad
4 Ordenar por edad ASC
5 Mostrar el mas viejo y el mas joven
6 Mostrar los que son estudiantes
7 Mostrar los items la decha de nacimiento sea < 1980/02/01
8 Buscador por frases
*/
//Moridos
document.querySelector("#moridos").addEventListener('click',(evt)=>{
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.status == 'deceased')
    imprimir(arr_original)
})
//Menores de edad
document.querySelector("#menoresEdad").addEventListener('click',(evt)=>{
    //Evitar recarga
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.age < 18)
    imprimir(res)
})
//Promedio de edad

//Ordenar por edad

//Mostrar el mas viejo y el mas joven

//Mostrar los que son estudiantes
document.querySelector("#students").addEventListener('click',(evt)=>{
    evt.preventDefault()
    let res = arr_original.filter((item)=>item.personaje.occupation == 'Student at Springfield Elementary School')
    imprimir(arr_original)
})
//Fechas de nacimiento < 1980/02/01

//Buscador de frases