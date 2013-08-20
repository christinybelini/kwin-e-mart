$(document).ready(function(){
	$('#conteudoMarca').hide();

	$('a#exibirMarca').click(function(){
		$('#conteudoMarca').show('slow');
	});

	$('a#ocultarMarca').click(function(){
		$('#conteudoMarca').hide('slow');
	});
});

$(document).ready(function(){
	$('#conteudoCat').hide();

	$('a#exibirCat').click(function(){
		$('#conteudoCat').show('slow');
	});

	$('a#ocultarCat').click(function(){
		$('#conteudoCat').hide('slow');
	});
});