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
document.querySelector("#viejo_joven").addEventListener('click', (evt) => {
    evt.preventDefault();
    let filtrados = arr_original.filter(item => item.personaje && typeof item.personaje.age === "number");

    let ordenados = [...filtrados].sort((a, b) => a.personaje.age - b.personaje.age);

    let joven = ordenados[0];
    let viejo = ordenados[ordenados.length - 1];

    imprimir([joven, viejo]);
});

//Mostrar los que son estudiantes
document.querySelector("#students").addEventListener('click', (evt) => {
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
document.querySelector("#fecha").addEventListener('click', (evt) => {
    evt.preventDefault();
    
    let fechaLimite = new Date('1980-02-01');
    
    let res = arr_original.filter(item => {
        if (item.personaje && item.personaje.birth_date) {
            let fechaNacimiento = new Date(item.personaje.birth_date);
            return fechaNacimiento < fechaLimite;
        }
        return false;
    });
    
    console.log("Personajes nacidos antes de 1980/02/01:", res);
    imprimir(res);
});

//Buscador de frases
document.querySelector(".search input").addEventListener('input', (evt) => {
    let busqueda = evt.target.value.toLowerCase().trim();
    
    if (busqueda === '') {
        imprimir(arr_original);
        return;
    }
    
    let res = arr_original.filter(item => {
        if (item.personaje && Array.isArray(item.personaje.phrases) && item.personaje.phrases.length > 0) {
            let encontrado = item.personaje.phrases.some(frase => 
                frase.toLowerCase().includes(busqueda)
            );
            if (encontrado) {
                console.log(`Encontrado en ${item.personaje.name}:`, item.personaje.phrases);
            }
            return encontrado;
        }
        return false;
    });
    
    console.log(`Buscando frase: "${busqueda}", Personajes encontrados:`, res.length);
    
    if (res.length === 0) {
        ul.innerHTML = '<li style="grid-column: 1/-1; text-align: center; padding: 40px;"><h2>No se encontraron personajes con esa frase</h2><p>Espera unos segundos si acabas de cargar la página</p></li>';
    } else {
        imprimir(res);
    }
});