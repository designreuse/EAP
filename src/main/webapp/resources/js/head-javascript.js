function pageScroll() {  
window.scrollBy(0,-10);  
scrolldelay = setTimeout('pageScroll()',1000);  
if(document.documentElement.scrollTop==0) clearTimeout(scrolldelay);  
}  
