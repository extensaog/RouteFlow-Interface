<html>
<head>
	<g:render template="/layouts/resources" />
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css"/>
	
<script>

<%--	var str='${teste}';--%>
<%--	var n=str.indexOf("lxc");--%>
	console.log(${teste2});

	function desenhaTopologia(nroNode, ip1, ip2, ip3, ip4, gw1, gw2, gw3, gw4){
		var cor = '#003300';
		var cont = 1;
		var radius = 20;
		var canvas = document.getElementById('myCanvas');
	    var context = canvas.getContext('2d');
	    context.clearRect(0, 0, canvas.width, canvas.height);
		if(nroNode === 1){
			
			//ligacao
			context.lineWidth = 5;
			context.strokeStyle = '#000000';
			context.stroke();
			context.moveTo(120,200);
			context.lineTo(880,200);
			context.stroke();

			//b1
			context.beginPath();
		    context.arc(100, 200, radius, 0, 2 * Math.PI, false);
		    context.fillStyle = cor;
		    context.fill();

		  	//b2
		    context.beginPath();
		    context.arc(900, 200, radius, 0, 2 * Math.PI, false);
		    context.fillStyle = cor;
		    context.fill();

		    //gateway
		    context.fillStyle="#191970";
			context.fillRect(450,175,50,50);
			context.font="25px Arial";
			context.fillStyle="#000000";
			context.fillText('Port 1: ' + ip3,390,140);
			context.fillText('Port 2: ' + ip4,390,170);
			context.fillText('${files[0]}',450,250);
						
			var vm1 = 0;
			<g:each in="${mcRfvm1}">
				context.fillText('${it}',400,290 + vm1);
				vm1 = vm1 + 30;

			</g:each>
			

			//router 1
			context.fillStyle="#003300";
			context.font="25px Arial";
			context.fillText('${files[1]}',45,210);
			context.fillText(ip1,40,250);
			context.fillText('GW: '+ ip3,20,290);
			context.fillText('MAC: '+ '${mcB1[0]}',20,320);
			
			//router 2
			context.fillText(ip2,820,250);
		    context.fillText('GW: '+ ip4,790,290);
		    context.fillText('${files[2]}',930,210);
		    context.fillText('MAC: '+ '${mcB2[0]}',770,320);
		    
		    if(Intvl2 != null)
		    	window.clearInterval(Intvl2);
		    var Intvl = setInterval(function(){
				switch(cont){
				case 1:
					
					cor = '#003300';
					var canvas = document.getElementById('myCanvas');
				    var context = canvas.getContext('2d');
				    var centerX = canvas.width / 2;
				    var centerY = canvas.height / 2;
				    var radius = 20;
				    				    
				    setTimeout(function(){
				    context.beginPath();
				    context.arc(900, 200, radius, 0, 2 * Math.PI, false);
				    context.fillStyle = cor;
				    context.fill();
				    context.lineWidth = 5;
				    context.strokeStyle = '#003300';
				    context.stroke();
				    
		
<%--				    context.moveTo(120,200);--%>
<%--				    context.lineTo(880,200);--%>
				    context.stroke();
				    cont = 2;
				    }, 500);
				    break;

				case 2:
					cor = 'green';
				    var canvas = document.getElementById('myCanvas');
				    var context = canvas.getContext('2d');
				    var centerX = canvas.width / 2;
				    var centerY = canvas.height / 2;
				    var radius = 20;
		
				    context.beginPath();
				    context.arc(100, 200, radius, 0, 2 * Math.PI, false);
				    context.fillStyle = cor;
				    context.fill();
				    context.lineWidth = 5;
				    context.strokeStyle = '#003300';
				    context.stroke();
		
				    context.beginPath();
				    context.arc(900, 200, radius, 0, 2 * Math.PI, false);
				    context.fillStyle = cor;
				    context.fill();
				    context.lineWidth = 5;
				    context.strokeStyle = '#003300';
				    context.stroke();
		
				    
				    cont = 1;
				    break;
				}
		    
			}, 1000);	
			
		}

		if(nroNode === 2){
			if(Intvl != null)
				clearInterval(Intvl);
			/* ###############    Nohs    ############## */
			//h1
			context.beginPath();
		    context.arc(100, 150, 20, 0, 2 * Math.PI, false);
		    context.fillStyle = '#003300';
		    context.fill();
		    context.lineWidth = 5;
		    context.strokeStyle = '#003300';
		    context.stroke();
		    context.fillStyle="#003300";
			context.font="25px Arial";
			context.fillText('h1',30,160);
			context.fillText(ip1,20,210); //ip1
			
			//h2
			context.beginPath();
		    context.arc(750, 150, 20, 0, 2 * Math.PI, false);
		    context.fillStyle = '#003300';
		    context.fill();
		    context.lineWidth = 5;
		    context.strokeStyle = '#003300';
		    context.stroke();
		    context.fillStyle="#003300";
			context.font="25px Arial";
			context.fillText('h2',790,160);
			context.fillText(ip2,650,210); //ip2	

			//h3
			context.beginPath();
		    context.arc(100, 375, 20, 0, 2 * Math.PI, false);
		    context.fillStyle = '#003300';
		    context.fill();
		    context.lineWidth = 5;
		    context.strokeStyle = '#003300';
		    context.stroke();
		    context.fillStyle="#003300";
			context.font="25px Arial";
			context.fillText('h3',30,380);
			context.fillText(ip3,20,350); //ip3

			//h4
			context.beginPath();
		    context.arc(750, 375, 20, 0, 2 * Math.PI, false);
		    context.fillStyle = '#003300';
		    context.fill();
		    context.lineWidth = 5;
		    context.strokeStyle = '#003300';
		    context.stroke();
		    context.fillStyle="#003300";
			context.font="25px Arial";
			context.fillText('h4',790,380);
			context.fillText(ip4,650,350); //ip4		   

			/* ######################################## */

		    

			/* ############### Ligacoes ############## */
			//h1 para router A
			context.moveTo(120,150);
			context.lineTo(220,150);
			context.stroke();

			//router A para router B
			context.moveTo(220,150);
			context.lineTo(620,150);
			context.stroke();

			//h2 para router B
			context.moveTo(630,150);
			context.lineTo(750,150);
			context.stroke();

			//router D para router B
			context.moveTo(625,150);
			context.lineTo(625,375);
			context.stroke();
			

			//h4 para router D
			context.moveTo(630,375);
			context.lineTo(750,375);
			context.stroke();

			//router D para router C
			context.moveTo(220,375);
			context.lineTo(620,375);
			context.stroke();

			//h3 para router C
			context.moveTo(120,375);
			context.lineTo(220,375);
			context.stroke();

			//router C para router A
			context.moveTo(225,150);
			context.lineTo(225,375);
			context.stroke();

			//router D para router A
			context.moveTo(225,150);
			context.lineTo(630,375);
			context.stroke();
			

			/* ####################################### */

			/* ############### Roteadores ############## */
			//Router A
			context.fillStyle="#191970";
			context.fillRect(200,125,50,50);
			context.fillStyle="#FFFFFF";
			context.font="18px Arial";
			context.fillText('${files[3]}',203,160);
			context.fillStyle="#000000";
			context.font="25px Arial";
			
			var port1 = 0;
			for (var i=0,len=gw1.length; i<len; i++)
			{ 
				context.fillText(gw1[i],150,120 + port1);
				port1 = port1 - 30;
			}

			//Router C
			context.fillStyle="#191970";
			context.fillRect(200,350,50,50);
			context.fillStyle="#FFFFFF";
			context.font="18px Arial";
			context.fillText('${files[5]}',203,385);
			context.fillStyle="#000000";
			context.font="25px Arial";

			var port3 = 0;
			for (var i=0,len=gw3.length; i<len; i++)
			{ 
				context.fillText(gw3[i],160,420 + port3);
				port3 = port3 + 30;
			}

			//Router B
			context.fillStyle="#191970";
			context.fillRect(600,125,50,50);
			context.fillStyle="#FFFFFF";
			context.font="18px Arial";
			context.fillText('${files[4]}',603,160);
			context.fillStyle="#000000";
			context.font="25px Arial";

			var port2 = 0;
			for (var i=0,len=gw2.length; i<len; i++)
			{ 
				context.fillText(gw2[i],560,120 + port2);
				port2 = port2 - 30;
			}

			//Router D
			context.fillStyle="#191970";
			context.fillRect(600,350,50,50);
			context.fillStyle="#FFFFFF";
			context.font="18px Arial";
			context.fillText('${files[6]}',603,385);
			context.fillStyle="#000000";
			context.font="25px Arial";

			var port4 = 0;
			for (var i=0,len=gw4.length; i<len; i++)
			{ 
				context.fillText(gw4[i],550,420 + port4);
				port4 = port4 + 30;
			}

			/* ######################################## */
			
			/* ################  MAC'S  ################# */
			context.font="20px Arial";
			var vmA = 0;
			var vmB = 0;
			var vmC = 0;
			var vmD = 0;

			context.fillStyle="#FF0000";
			context.fillText("MAC'S A: ",10,550 + vmA);
			context.fillText("MAC'S B: ",270,550 + vmB);
			context.fillText("MAC'S C: ",530,550 + vmC);
			context.fillText("MAC'S D: ",790,550 + vmD);

			context.fillStyle="#000000";
			<g:each in="${mcRfvmA}">
				context.fillText('${it}',100,550 + vmA);
				vmA = vmA + 30;

			</g:each>
			
			<g:each in="${mcRfvmB}">
				context.fillText('${it}',360,550 + vmB);
				vmB = vmB + 30;
			</g:each>
			
			<g:each in="${mcRfvmC}">
				context.fillText('${it}',620,550 + vmC);
				vmC = vmC + 30;
			</g:each>
			
			<g:each in="${mcRfvmD}">
			context.fillText('${it}',880,550 + vmD);
			vmD = vmD + 30;
		</g:each>
		/* ######################################## */
		
			var Intvl2 = setInterval(function(){
				var canvas = document.getElementById('myCanvas');
			    var context = canvas.getContext('2d');
			    var radius = 20;
				switch(cont){
				case 1:
					//h1
					context.beginPath();
				    context.arc(100, 150, radius, 0, 2 * Math.PI, false);
				    context.fillStyle = '#003300';
				    context.fill();
				    context.lineWidth = 5;
				    context.strokeStyle = cor;
				    context.stroke();

				  	//h2
				  	setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
						context.beginPath();
					    context.arc(750, 150, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = '#003300';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();

				  	}, 100);
				    				    
					//h3
					setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
					    context.beginPath();
					    context.arc(100, 375, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = '#003300';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();
					    cont = 2;
					},300);
				  	//h4
				  	setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
				  		context.beginPath();
					    context.arc(750, 375, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = '#003300';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();
					    cont = 2;

					}, 200);
				    

				    
				    break;

				case 2:

					//h1
					setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
						context.beginPath();
					    context.arc(100, 150, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = 'green';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();
					},300);

				  	//h2
				  	setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
					    context.beginPath();
					    context.arc(750, 150, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = 'green';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();
				  	},200);

				  	//h3
				  	setTimeout(function(){
				  		var canvas = document.getElementById('myCanvas');
					    var context = canvas.getContext('2d');
						context.beginPath();
					    context.arc(100, 375, radius, 0, 2 * Math.PI, false);
					    context.fillStyle = 'green';
					    context.fill();
					    context.lineWidth = 5;
					    context.strokeStyle = cor;
					    context.stroke();
				  	},100);

				 	//h4
					context.beginPath();
				    context.arc(750, 375, radius, 0, 2 * Math.PI, false);
				    context.fillStyle = 'green';
				    context.fill();
				    context.lineWidth = 5;
				    context.strokeStyle = cor;
				    context.stroke();
				    cont = 1;
					break;
				}
			}, 500);
			console.log(Intvl2);
		}

		

	}

	var gw1 = ['172.31.1.1/24', '10.0.0.1/24', '30.0.0.1/24', '50.0.0.1/24'];
	var gw2 = ['172.31.2.1/24', '10.0.0.2/24', '40.0.0.2/24'];
	var gw3 = ['172.31.3.1/24', '20.0.0.3/24', '30.0.0.3/24'];
	var gw4 = ['172.31.4.1/24', '40.0.0.4/24', '20.0.0.4/24', '50.0.0.4/24'];
	$(document).ready(function() {
<%--		desenhaTopologia(2, '172.31.1.100/24','172.31.2.100/24', '172.31.3.100/24','172.31.4.100/24', gw1,gw2, gw3, gw4);--%>
<%--		  		});--%>

<%--		desenhaTopologia(1, '172.31.1.2/24','172.31.2.2/24', '172.31.1.1/24','172.31.2.1/24');--%>
		});
	
</script>
</head>
<body>
	<div class="navbar navbar-inverse">
	  <div class="navbar-inner">
	  	<div class='interface'>Escolha um arquivo que deseja ver topologia </div>
	  </div>
	</div>	
	
	<div id='content'>
		
<%--		<g:each in="${files}">--%>
<%--			<button class='btn btn-info'>${it }</button>--%>
<%--		</g:each>--%>
			<button class='btn btn-info'onclick="desenhaTopologia(1, '172.31.1.2/24','172.31.2.2/24', '172.31.1.1/24','172.31.2.1/24');">rftest1</button>
			<button class='btn btn-info' onclick="desenhaTopologia(2, '172.31.1.100/24','172.31.2.100/24', '172.31.3.100/24','172.31.4.100/24', gw1,gw2, gw3, gw4);" >rftest2</button>
		<canvas id="myCanvas" width="1050" height="1000" 
		style="border:1px solid #000000;">
		</canvas>
	</div>


</body>

</html>