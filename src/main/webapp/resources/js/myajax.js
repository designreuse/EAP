function ajaxhttp_get(url)
{
var ajaxhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
	ajaxhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
	ajaxhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
ajaxhttp.open("GET",url,true);
ajaxhttp.send();
}