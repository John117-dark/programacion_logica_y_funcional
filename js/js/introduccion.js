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
    let res = arr_original.filter((item)=>item.personaje.status == 'Deceased')
    console.log(res)
    imprimir(res)
})
//Menores de edad
document.querySelector("#menores").addEventListener('click',(evt)=>{
    //Evitar recarga
    evt.preventDefault()
    let res = arr_original.filter(item =>
        item.personaje && item.personaje.age != null && item.personaje.age < 18
    );    
    imprimir(res)
})
//Promedio de edad
document.querySelector("#promedio").addEventListener('click', (evt) => {
    evt.preventDefault();
    let edades = arr_original
        .filter(item => item.personaje && typeof item.personaje.age === "number")
        .map(item => item.personaje.age);

    let promedio = edades.reduce((acc, val) => acc + val, 0) / edades.length;

    alert(`El promedio de edad es: ${promedio.toFixed(2)}`);
});
//Ordenar por edad
document.querySelector("#ordenEdad").addEventListener('click', (evt) => {
    evt.preventDefault();
    let res = arr_original
        .filter(item => item.personaje && typeof item.personaje.age === "number")
        .sort((a, b) => a.personaje.age - b.personaje.age);

    imprimir(res);
});
//Mostrar el mas viejo y el mas joven
document.querySelector("#extremosEdad").addEventListener('click', (evt) => {
    evt.preventDefault();
    let filtrados = arr_original.filter(item => item.personaje && typeof item.personaje.age === "number");

    let ordenados = [...filtrados].sort((a, b) => a.personaje.age - b.personaje.age);

    let joven = ordenados[0];
    let viejo = ordenados[ordenados.length - 1];

    imprimir([joven, viejo]);
});
//Mostrar los que son estudiantes
document.querySelector("#students").addEventListener('click',(evt)=>{
    evt.preventDefault()
    let res = arr_original.filter(item =>
        item.personaje &&
        typeof item.personaje.occupation === 'string' &&
        item.personaje.occupation.toLowerCase().includes('student')
    );
    console.log(res)    
    imprimir(res)
})
//Fechas de nacimiento < 1980/02/01

//Buscador de frases