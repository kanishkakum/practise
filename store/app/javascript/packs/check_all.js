document.addEventListener('DOMContentLoaded',() => {

  let check = document.querySelector('#checkall');
  check.addEventListener('click',() => {
    check_all();
  });

  function check_all(){
    console.log("hii where");
    let e = document.querySelectorAll(".mycheck");
    e.forEach((ele) => {
      console.log("hello hii");
      ele.checked = ele.checked ? false : true;
      console.log('e',ele,ele.checked);
    })
  }
})