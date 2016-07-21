
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">	  
		<meta charset="utf-8">

<style>

#image_title_ch {
	position: absolute;
	top: 10px;
	left:20px;
	font-size: 25px;
	font-weight: bold;
	font-family: SimHei;
	color: rgba(255,255,255,0.75);
	text-shadow: 0 0 10px rgba(0,255,255,0.95);
}
#image_title_en {
	position: absolute;
	top: 250px;
	right: 10px;
	font-size: 16px;
	font-weight: bold;
	font-family: Helvetica, sans-serif;
	color: rgba(255,255,255,0.75);
	text-shadow: 0 0 10px rgba(0,255,255,0.95);
}

.element {
	width: 120px;
	height: 160px;
	box-shadow: 0px 0px 12px rgba(0,255,255,0.5);
	border: 1px solid rgba(127,255,255,0.25);
	text-align: center;
	cursor: default;
}

.element:hover {
	box-shadow: 0px 0px 12px rgba(0,255,255,0.75);
	border: 1px solid rgba(127,255,255,0.75);
}

	.element .number {
		position: absolute;
		top: 20px;
		right: 20px;
		font-size: 12px;
		color: rgba(127,255,255,0.75);
		display:none;
	}

	.element .symbol {
		position: absolute;
		top: 40px;
		left: 0px;
		right: 0px;
		font-size: 35px;
		font-weight: bold;
		font-family: SimHei;
		color: rgba(255,255,255,0.75);
		text-shadow: 0 0 10px rgba(0,255,255,0.95);
	}

	.element .details {
		position: absolute;
		bottom: 15px;
		left: 0px;
		right: 0px;
		font-size: 12px;
		color: rgba(127,255,255,0.75);
	}

button {
	color: rgba(127,255,255,0.75);
	background: transparent;
	outline: 1px solid rgba(127,255,255,0.75);
	border: 0px;
	padding: 5px 10px;
	cursor: pointer;
	display:none;
}
button:hover {
	background-color: rgba(0,255,255,0.5);
}
button:active {
	color: #000000;
	background-color: rgba(0,255,255,0.75);
}
</style>
</head>
<body>
 
<script src="resources/js/three.min.js"></script>
<script src="resources/js/tween.min.js"></script>
<script src="resources/js/TrackballControls.js"></script>
<script src="resources/js/CSS3DRenderer.js"></script>
<div id="container"></div>
<div id="image_title_ch">
 中国科学院实验动物平台<br/>
<font  style="font-size:14px;">Experimental Animal Platform, Chinese Academy of Sciences</font>
<button id="sphere" hidden></button>
<button id="helix" hidden></button>
<button id="grid" hidden></button>
<button id="table" hidden></button>
</div>
<div id="image_title_en">
<img src="resources/images/zky_light.png" width="100px" height="100px" />
</div>
<script>

var table = [
         	"小鼠", "Muridae", "Mus", 1, 1,
        	"大鼠", "Muridae", "Rattus", 18, 1,
        	"豚鼠", "Caviidae", "Cavia", 1, 2,
        	"仓鼠", "Muridae", "Mesocricetus", 2, 2,
        	"沙鼠", "Circetidae", "Genus", 13, 2,
        	"田鼠", "Muridae", "Microtus", 14, 2,
        	"家兔", "Leporidae", "Oryctolagus", 15, 2,
        	"雪貂", "Mustelidae", "Mustela ", 16, 2,
        	"犬", "Canidea", "Canis", 17, 2,
        	"食蟹猴", "Macaca", "Macaca", 18, 2,
        	"恒河猴", "Cercopithecidae", "Macaca", 1, 3,
        	"鸡", "Phasianidae", "gallus", 2, 3,
        	"鸽", "Columba", "Aplopelia", 13, 3,
        	"鹌鹑", "Coturnix", "Coturnix", 14, 3,
        	"灰仓鼠", "Cricetidae", "Cricetulus", 15, 3,
        	"蕨麻猪", "Suidae", "Sus", 16, 3,
        	"西藏猪", "Suidae", "Scrofa", 17, 3,
        	"白山羊", "Bovidae", "Ovis", 18, 3,
        	"大耳羊", "Bovidae", "Capra", 1, 4,
        	"猫", "Felidae", "Felis", 2, 4,
        	"剑尾鱼", "Poeciliidae", "Xiphophorus", 3, 4,
        	"虾虎鱼", "Gobiidae", "Mugilogobius", 4, 4,
        	"斑马鱼", "Cyprinidae", "Danio", 5, 4,
        	"果蝇", "Drosophilidae", "Drosophila", 6, 4,
        	"鸭", "Anatidae", "Anas", 7, 4,
        	"树鼩", "Tupaiides", "Tupaia", 8, 4,
        	"蝗虫", "Orthoptera", "Acrididae", 9, 4,
        	"按蚊", "Culicidae", "Anopheles", 10, 4,
        	"伊蚊", "Culicidae", "Anopheles", 11, 4,
        	"星天牛", "Cerambycidae", "Anoplophora", 12, 4,
        	"林蛙", "Ranidae", "Aana", 13, 4,
        	"狨猴", "Primates", "Callitrichinae", 14, 4,
        	"大猩猩", "Hominidae", "Gorilla", 15, 4,
        	"灰仓鼠", "Cricetidae", "Cricetulus", 16, 4,
        	"小鼠", "Muridae", "Mus",  17, 4,
        	"豚鼠", "Caviidae", "Cavia", 18, 4,
        	"田鼠", "Muridae", "Microtus", 1, 5,
        	"沙鼠", "Circetidae", "Genus", 2, 5,
        	"恒河猴", "Cercopithecidae", "Macaca",3, 5,
        	"鸭", "Anatidae", "Anas", 4, 5,
        	"果蝇", "Drosophilidae", "Drosophila", 5, 5,
        	"猫", "Felidae", "Felis", 6, 5,
        	"斑马鱼", "Cyprinidae", "Danio", 7, 5,
        	"白山羊", "Bovidae", "Ovis", 8, 5,
        	"树鼩", "Tupaiides", "Tupaia", 9, 5,
        	"按蚊", "Culicidae", "Anopheles",  10, 5,
        	"蕨麻猪", "Suidae", "Sus", 11, 5,
        	"家兔", "Leporidae", "Oryctolagus", 12, 5,
        	"犬", "Canidea", "Canis",  13, 5,
        	"食蟹猴", "Macaca", "Macaca", 14, 5,
        	"虾虎鱼", "Gobiidae", "Mugilogobius",  15, 5,
        	"鹌鹑", "Coturnix", "Coturnix", 16, 5,
        	"狨猴", "Primates", "Callitrichinae", 17, 5,
        	"恒河猴", "Cercopithecidae", "Macaca", 18, 5,
        	"大猩猩", "Hominidae", "Gorilla", 1, 6,
        	"斑马鱼", "Cyprinidae", "Danio",  2, 6,
        	"雪貂", "Mustelidae", "Mustela ", 4, 9,
        	"大鼠", "Muridae", "Rattus",  5, 9,
        	"小鼠", "Muridae", "Mus", 6, 9,
        	"鸽", "Columba", "Aplopelia", 7, 9,
        	"鸡", "Phasianidae", "gallus", 8, 9,
        	"沙鼠", "Circetidae", "Genus",9, 9,
        	"田鼠", "Muridae", "Microtus",  10, 9,
        	"恒河猴", "Cercopithecidae", "Macaca", 11, 9,
        	"星天牛", "Cerambycidae", "Anoplophora", 12, 9,
        	"仓鼠", "Muridae", "Mesocricetus",13, 9,
        	"犬", "Canidea", "Canis", 14, 9,
        	"蕨麻猪", "Suidae", "Sus",15, 9,
        	"灰仓鼠", "Cricetidae", "Cricetulus", 16, 9,
        	"猫", "Felidae", "Felis", 17, 9,
        	"伊蚊", "Culicidae", "Anopheles", 18, 9,
        	"家兔", "Leporidae", "Oryctolagus", 4, 6,
        	"西藏猪", "Suidae", "Scrofa", 5, 6,
        	"田鼠", "Muridae", "Microtus", 6, 6,
        	"白山羊", "Bovidae", "Ovis", 7, 6,
        	"林蛙", "Ranidae", "Aana",  8, 6,
        	"大猩猩", "Hominidae", "Gorilla", 9, 6,
        	"狨猴", "Primates", "Callitrichinae", 10, 6,
        	"星天牛", "Cerambycidae", "Anoplophora",11, 6,
        	"鸡", "Phasianidae", "gallus", 12, 6,
        	"西藏猪", "Suidae", "Scrofa", 13, 6,
        	"剑尾鱼", "Poeciliidae", "Xiphophorus", 14, 6,
        	"蝗虫", "Orthoptera", "Acrididae", 15, 6,
        	"虾虎鱼", "Gobiidae", "Mugilogobius", 16, 6,
        	"灰仓鼠", "Cricetidae", "Cricetulus", 17, 6,
        	"鹌鹑", "Coturnix", "Coturnix", 18, 6,
        	"食蟹猴", "Macaca", "Macaca",  1, 7,
        	"家兔", "Leporidae", "Oryctolagus", 2, 7,
        	"大鼠", "Muridae", "Rattus", 4, 10,
        	"大猩猩", "Hominidae", "Gorilla", 5, 10,
        	"狨猴", "Primates", "Callitrichinae", 6, 10,
        	"林蛙", "Ranidae", "Aana",7, 10,
        	"星天牛", "Cerambycidae", "Anoplophora", 8, 10,
        	"伊蚊", "Culicidae", "Anopheles", 9, 10,
        	"按蚊", "Culicidae", "Anopheles", 10, 10,
        	"蝗虫", "Orthoptera", "Acrididae", 11, 10,
        	"树鼩", "Tupaiides", "Tupaia", 12, 10,
        	"鸭", "Anatidae", "Anas", 13, 10,
        	"果蝇", "Drosophilidae", "Drosophila", 14, 10,
        	"斑马鱼", "Cyprinidae", "Danio", 15, 10,
        	"虾虎鱼", "Gobiidae", "Mugilogobius", 16, 10,
        	"剑尾鱼", "Poeciliidae", "Xiphophorus", 17, 10,
        	"猫", "Felidae", "Felis", 18, 10,
        	"大耳羊", "Bovidae", "Capra", 4, 7,
        	"西藏猪", "Suidae", "Scrofa", 5, 7,
        	"白山羊", "Bovidae", "Ovis", 6, 7,
        	"蕨麻猪", "Suidae", "Sus", 7, 7,
        	"灰仓鼠", "Cricetidae", "Cricetulus", 8, 7,
        	"鸽", "Columba", "Aplopelia", 9, 7,
        	"鹌鹑", "Coturnix", "Coturnix", 10, 7,
        	"鸡", "Phasianidae", "gallus", 11, 7,
        	"恒河猴", "Cercopithecidae", "Macaca", 12, 7,
        	"虾虎鱼", "Gobiidae", "Mugilogobius",  13, 7,
        	"雪貂", "Mustelidae", "Mustela ", 14, 7,
        	"家兔", "Leporidae", "Oryctolagus", 15, 7,
        	"豚鼠", "Caviidae", "Cavia", 16, 7,
        	"大鼠", "Muridae", "Rattus", 17, 7,
        	"小鼠", "Muridae", "Mus", 18, 7,
        	"蕨麻猪", "Suidae", "Sus", 11, 5,
        	"家兔", "Leporidae", "Oryctolagus", 12, 5,
        ];

var camera, scene, renderer;
var controls;

var objects = [];
var targets = { table: [], sphere: [], helix: [], grid: [] };

init();
animate();

function init() {

	camera = new THREE.PerspectiveCamera( 18, window.innerWidth / window.innerHeight, 1, 10000 );
	camera.position.z = 3000;

	scene = new THREE.Scene();

	// table

	for ( var i = 0; i < table.length; i += 5 ) {

		var element = document.createElement( 'div' );
		element.className = 'element';
		element.style.backgroundColor = 'rgba(0,127,127,' + ( Math.random() * 0.5 + 0.25 ) + ')';

		var number = document.createElement( 'div' );
		number.className = 'number';
		number.textContent = (i/5) + 1;
		element.appendChild( number );

		var symbol = document.createElement( 'div' );
		symbol.className = 'symbol';
		symbol.textContent = table[ i ];
		element.appendChild( symbol );

		var details = document.createElement( 'div' );
		details.className = 'details';
		details.innerHTML = table[ i + 1 ] + '<br>' + table[ i + 2 ];
		element.appendChild( details );

		var object = new THREE.CSS3DObject( element );
		object.position.x = Math.random() * 4000 - 2000;
		object.position.y = Math.random() * 4000 - 2000;
		object.position.z = Math.random() * 4000 - 2000;
		scene.add( object );

		objects.push( object );

		//

		var object = new THREE.Object3D();
		object.position.x = ( table[ i + 3 ] * 140 ) - 1330;
		object.position.y = - ( table[ i + 4 ] * 180 ) + 990;

		targets.table.push( object );

	}

	// sphere

	var vector = new THREE.Vector3();

	for ( var i = 0, l = objects.length; i < l; i ++ ) {

		var phi = Math.acos( -1 + ( 2 * i ) / l );
		var theta = Math.sqrt( l * Math.PI ) * phi;

		var object = new THREE.Object3D();

		object.position.x = 800 * Math.cos( theta ) * Math.sin( phi );
		object.position.y = 800 * Math.sin( theta ) * Math.sin( phi );
		object.position.z = 800 * Math.cos( phi );

		vector.copy( object.position ).multiplyScalar( 2 );

		object.lookAt( vector );

		targets.sphere.push( object );

	}

	// helix

	var vector = new THREE.Vector3();

	for ( var i = 0, l = objects.length; i < l; i ++ ) {

		var phi = i * 0.175 + Math.PI;

		var object = new THREE.Object3D();

		object.position.x = 900 * Math.sin( phi );
		object.position.y = - ( i * 8 ) + 450;
		object.position.z = 900 * Math.cos( phi );

		vector.x = object.position.x * 2;
		vector.y = object.position.y;
		vector.z = object.position.z * 2;

		object.lookAt( vector );

		targets.helix.push( object );

	}

	// grid

	for ( var i = 0; i < objects.length; i ++ ) {

		var object = new THREE.Object3D();

		object.position.x = ( ( i % 5 ) * 400 ) - 800;
		object.position.y = ( - ( Math.floor( i / 5 ) % 5 ) * 400 ) + 800;
		object.position.z = ( Math.floor( i / 25 ) ) * 1000 - 2000;

		targets.grid.push( object );

	}

	//

	renderer = new THREE.CSS3DRenderer();
	renderer.setSize( window.innerWidth, window.innerHeight );
	renderer.domElement.style.position = 'absolute';
	document.getElementById( 'container' ).appendChild( renderer.domElement );

	//

	controls = new THREE.TrackballControls( camera, renderer.domElement );
	controls.rotateSpeed = 0.5;
	controls.minDistance = 500;
	controls.maxDistance = 6000;
	controls.addEventListener( 'change', render );

	var button = document.getElementById( 'table' );
	button.addEventListener( 'click', function ( event ) {

		transform( targets.table, 2000 );

	}, false );

	var button = document.getElementById( 'sphere' );
	button.addEventListener( 'click', function ( event ) {

		transform( targets.sphere, 2000 );

	}, false );

	var button = document.getElementById( 'helix' );
	button.addEventListener( 'click', function ( event ) {

		transform( targets.helix, 2000 );

	}, false );

	var button = document.getElementById( 'grid' );
	button.addEventListener( 'click', function ( event ) {

		transform( targets.grid, 2000 );

	}, false );
	
	var default_style=Math.random();
	//alert(default_style);  
	if(default_style > 0.66)
		{
		transform( targets.grid, 5000 );
		}
	else if(default_style < 0.34)
		{
			transform( targets.helix, 5000 );
		}
	else if(default_style>=0.34 && default_style<=0.66)
		{
			transform( targets.sphere, 5000 );
		}
	window.addEventListener( 'resize', onWindowResize, false );

}

function transform( targets, duration ) {

	TWEEN.removeAll();

	for ( var i = 0; i < objects.length; i ++ ) {

		var object = objects[ i ];
		var target = targets[ i ];

		new TWEEN.Tween( object.position )
			.to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
			.easing( TWEEN.Easing.Exponential.InOut )
			.start();

		new TWEEN.Tween( object.rotation )
			.to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
			.easing( TWEEN.Easing.Exponential.InOut )
			.start();

	}

	new TWEEN.Tween( this )
		.to( {}, duration * 2 )
		.onUpdate( render )
		.start();

}

function onWindowResize() {

	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();

	renderer.setSize( window.innerWidth, window.innerHeight );

	render();

}

function animate() {

	requestAnimationFrame( animate );

	TWEEN.update();

	controls.update();

}

function render() {

	renderer.render( scene, camera );

}

</script>
</body>
</html>