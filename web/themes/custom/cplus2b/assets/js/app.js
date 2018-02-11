var btnMenu = document.getElementById('burger-menu');
var leMenu = document.getElementById('leMenu');
var btnClose = document.getElementById('close-menu');

btnMenu.addEventListener("click",openMenu);
btnClose.addEventListener("click",closeMenu);

function openMenu() {
	// leMenu.style.display = "flex";
	leMenu.classList.add('moved');
}

function closeMenu() {
	// leMenu.style.display = "none";
	leMenu.classList.remove('moved');
}
