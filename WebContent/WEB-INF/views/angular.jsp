<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Esto es Boostrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />

<!-- Se coloca para trabajar con ANGULARJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <!-- Trabajando con iconos -->

<title>Correo</title>
</head>
<body data-ng-app="correo" data-ng-controller="controlador">
	<center>
		<h1>Enviar Correo</h1>
		<form style="width: 40%;">

			<div class="form-group">
				<label>Email</label> 
				<input name="recipient" placeholder="name@hotmail.com" type="email" ng-model="email.recipient" class="form-control" />		
			</div>

			<div class="form-group">
				<label>Motivo</label> 
				<input name="subject" placeholder="Motivo del Mensaje" type="text" ng-model="email.subject" class="form-control" />
			</div>

			<div class="form-group">
				<label>Mensaje</label>
				<textarea name="message" rows="10" ng-model="email.message" placeholder="Escriba su Mensaje" class="form-control" /></textarea>
			</div>

			<button type="submit" class="btn btn-primary"
				ng-click="enviar()">Enviar Email</button>
			<!--<input type="submit" value="Send E-mail" />-->

		</form>
	</center>

	<script>
		var app = angular.module('correo', []);
		app.controller('controlador', function($scope, $http) {

			var envioDeDatosParaCorreo=$scope.email={};
			
			console.log(envioDeDatosParaCorreo)
			
			$scope.enviar = function() {							
				$http.post("index", envioDeDatosParaCorreo).success(function(res) {
					//recargar la pagina actual sirve para direcionar a otra url tambien
					location.reload(true);
				});

			}

		});
	</script>
</body>
</html>