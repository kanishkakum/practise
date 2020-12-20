document.addEventListener("DOMContentLoaded",() => {


let check = document.querySelector('#chck');
check.addEventListener('click',()=>{
	check_all();
});

function check_all(){
	let e = document.querySelectorAll(".mychck")
	e.forEach((ele) => {
		ele.checked = ele.checked ? false : true;
		console.log('e', ele, ele.checked)
	})
	// console.log('e', e, e.checked)
	// e.checked = true
	// document.getElementById("mycheck").checked = true;
}

})