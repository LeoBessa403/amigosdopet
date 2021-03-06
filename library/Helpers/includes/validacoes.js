$(function() { 
    
    //VARIÁVEIS GLOBAIS
    var home    = servidor_inicial();
    var inativo = inatividade();
    var urlValida = home + 'library/Helpers/Valida.Controller.php';
    
    // DESLOGA USUÁRIO INATIVO
    setTimeout(function(){  location.reload(); }, (1001 * inativo * 60) ); 	

        //function to initiate Select2        
       $(".search-select").select2({          
           allowClear: false
       });
       
        function validaData(data, id) {
           if (data != "") {
               var erro = "";
               var bissexto = 0;
               var tam = data.length;
               if (tam == 10) {
                   var dia = data.substr(0, 2);
                   var mes = data.substr(3, 2);
                   var ano = data.substr(6, 4);
                   if ((ano > 1900) || (ano < 2100)) {
                       switch (mes) {
                           case '01':
                           case '03':
                           case '05':
                           case '07':
                           case '08':
                           case '10':
                           case '12':
                               if (dia <= 31) {
                                   erro = true;
                               }
                               break
                           case '04':
                           case '06':
                           case '09':
                           case '11':
                               if (dia <= 30) {
                                   erro = true;
                               }
                               break
                           case '02':
                               if ((ano % 4 == 0) || (ano % 100 == 0) || (ano % 400 == 0)) {
                                   bissexto = 1;
                               }
                               if ((bissexto == 1) && (dia <= 29)) {
                                   erro = true;
                               }
                               if ((bissexto != 1) && (dia <= 28)) {
                                   erro = true;
                               }
                               break
                           }
                   }
               }
               if (erro != true) {
                   validaErro(id,"DATA Informada Inválida!");                     
               } else {
                   validaOK(id,"Data válida!");                    
               }
           }
        }
        function validaCPF(cpf, id) {
            if (cpf != "") {
                $.get(urlValida, {valida: 'valcpf', cpf: cpf}, function(retorno) {
                    if (retorno == 2) { 
                        validaErro(id,"CPF inválido! favor verificar.");                        
                    } else {
                        validaOK(id,"CPF válido!");
                    }
                });
            }
        }
        function validaEmail(email, id) { 
            if (email != "") {
                $.get(urlValida, {valida: 'valemail', email: email}, function(retorno) { 
                    if (retorno == 2) {
                        validaErro(id,"E-mail incorreto! favor verificar.");
                    } else {
                        validaOK(id,"E-mail válido!");
                    }
                });
            }
        }
        function validaCNPJ(cnpj, id) {
            if (cnpj != "") {
                $.get(urlValida, {valida: 'valcnpj', cnpj: cnpj}, function(retorno) {
                    if (retorno == 2) {
                        validaErro(id,"CNPJ inválido! favor verificar.");
                    } else {
                        validaOK(id,"CNPJ válido!");
                    }
                });
            }
        }
        function validaSenha(id,senha){
            var tamanho = senha.length;
            var forca = 0;
            if((tamanho >= 4) && (tamanho <= 7)){
		forca += 10;
            }else if(tamanho>7){
                    forca += 25;
            }
            if(senha.match(/[a-z]+/)){
                    forca += 10;
            }
            if(senha.match(/[A-Z]+/)){
                    forca += 20;
            }
            if(senha.match(/\d+/)){
                    forca += 20;
            }
            if(senha.match(/\W+/)){
                    forca += 25;
            }
            
            if(forca < 30){
                    validaErro(id,"Fraca");
            }else if((forca >= 30) && (forca < 60)){
                    validaErro(id,"Razoável");
            }else if((forca >= 60) && (forca < 85)){
                    validaOK(id,"Boa");
            }else{
                    validaOK(id,"Excelente");
            }
            
        }
        function confirma_senha(idC,senhaC){
             var senha = $(".senha").val();
             if(senhaC != senha){
                 validaErro(idC,"Diferente da Senha");
             }else{
                 validaOK(idC,"Confirmação OK");
             }
        }
        $(".formulario .ob").change(function(){
            var ob = $(this).val();
            var id = $(this).attr("id");
            var valida = $(this).hasClass("senha");
            var validaC = $(this).hasClass("confirma-senha");
            
            if(ob != "" && valida){
                validaSenha(id,ob);
            }else if(ob != "" && validaC){
                confirma_senha(id,ob);
            }else if(ob != ""){
                validaOK(id,"Campo Obrigatório OK!");
            }else{
                validaErro(id,"Campo Obrigatório");
            }
        });
        
        function validaErro(id, msg){
            $('#' + id).parent(".form-group").addClass('has-error').removeClass('has-success');
            $('.' + id).parent(".form-group").addClass('has-error').removeClass('has-success');
            $('span#' + id + '-info').text(msg).prepend('<i class="fa clip-cancel-circle-2"></i> ');
            return false;
        }
        
        function validaOK(id, msg){
           $('#' + id).parent(".form-group").addClass('has-success').removeClass('has-error');
           $('.' + id).parent(".form-group").addClass('has-success').removeClass('has-error');
           $('span#' + id + '-info').text(msg).prepend('<i class="fa clip-checkmark-circle-2"></i> ');
           return true;
        }
        
        // MASCARAS
        
        // Somente letras maiúsculas, minúsculas, numeros, espaço e acentos
        $(".nome").keyup(function() {
		var valor = $(this).val().replace(/[^a-zA-Z à-úÀ-Ú]+/g,'');
		$(this).val(valor);
	});
        $.mask.definitions['h'] = "[0-2]";
        $.mask.definitions['g'] = "[0-9]";
        $.mask.definitions['m'] = "[0-6]";
        $.mask.definitions['s'] = "[0-9]";
        $(".horas").mask("hg:ms").change(function(){
            var horas   = $(this).val().substring(0,2);
            var minutos = $(this).val().substring(3,5);
            var id = $(this).attr("id");
            if((horas > 23) || (minutos > 59)){
                validaErro(id,"Horário Inválido!");
                $(this).val("");
            }
        }).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^:]+/g,'');
		$(this).val(valor);
	});   
        $(".cep").mask("99.999-999").keyup(function() {
		var valor = $(this).val().replace(/[^0-9-.]+/g,'');
		var valor = valor.val().replace(/[^-.]+/g,'');
		$(this).val(valor);
	});
        $(".tel").mask("(99) 9999-9999?9").keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^()-]+/g,'');
		$(this).val(valor);
	});
        $(".tel0800").mask("0800-999-9999").keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^-]+/g,'');
		$(this).val(valor);
	});
        $(".data").mask("99/99/9999").change(function() {
            var data = $(this).val();
            var id = $(this).attr("id");
            validaData(data, id);
        }).datepicker({
            changeMonth: true, 
            changeYear: true, 
            yearRange: "c-80:c+15", 
            currentText: "Hoje", 
            monthNamesShort: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"], 
            dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"], 
            dateFormat: "dd/mm/yy", 
            showMonthAfterYear: true, 
            showAnim: "clip" }
         ).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^/]+/g,'');
		$(this).val(valor);
	});
        $(".cpf").mask("999.999.999-99").change(function() {
            var cpf = $(this).val();
            var id = $(this).attr("id");
            validaCPF(cpf, id);
        }).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^.-]+/g,'');
		$(this).val(valor);
	});
        $(".cnpj").mask("99.999.999/9999-99").change(function() {
            var cnpj = $(this).val();
            var id = $(this).attr("id");
            validaCNPJ(cnpj, id);
        }).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^/.-]+/g,'');
		$(this).val(valor);
	});
        $(".email").change(function() { 
            var email = $(this).val();
            var id = $(this).attr("id");
            validaEmail(email, id)
        });
        $(".senha").keyup(function() { 
            var senha = $(this).val();
            var id = $(this).attr("id");
            validaSenha(id,senha);
        });
        $(".confirma-senha").keyup(function() {
             var senhaC = $(this).val();
             var idC = $(this).attr("id");
             confirma_senha(idC,senhaC);
        });
        $(".numero").keypress(function(e) {
            var tecla = (window.event) ? event.keyCode : e.which;
            if ((tecla > 47 && tecla < 58))
                return true;
            else {
                if (tecla == 8 || tecla == 0)
                    return true;
                else
                    return false;
            }
        }).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		$(this).val(valor);
	});
        $(".moeda").maskMoney({
            symbol: 'R$ ',
            showSymbol: true,
            thousands: '.',
            decimal: ',',
            symbolStay: true
        }).focusout(function(){
            var valor = $(this).val();
            if(valor == "" || valor == "R$ 0,00"){
                $(this).val("");
            }
        }).keyup(function() {
		var valor = $(this).val().replace(/[^0-9]+/g,'');
		var valor = valor.val().replace(/[^,.]+/g,'');
		$(this).val(valor);
	});

        $(".formulario").submit(function() {
            var obrigatorios = campoObrigatorio();
            var validacao = "";
            $(".go-top,.alert .close").click();
            $(".formulario .has-error").each(function() {
                validacao = "error";
            });

            if (obrigatorios == true) {
                if (validacao == "error") {                   
//                  $(".row:last").before('<div class="alert alert-danger"><button data-dismiss="alert" class="close">&times;</button><i class="fa fa-exclamation-triangle"></i> <b> ALERTA: </b>Existe(em) campo(s) com erro, favor verificar!</div>');
                    Funcoes.Alerta("Existe(em) campo(s) com erro, favor verificar!"); 
                    return false;
                } 
            } else {
//              $(".row:last").before('<div class="alert alert-info"><button data-dismiss="alert" class="close">&times;</button><i class="fa fa-info-circle"></i> <b> INFORMATIVO: </b>Existe(em) campo(s) obrigatório(s) em branco, favor verificar!</div>');
                Funcoes.Informativo("Existe(em) campo(s) obrigatório(s) em branco, favor verificar!");
                return false;
            }
        });
        
         //CAMPO OBRIGATÓRIO 
        function campoObrigatorio() {
            var campos = "";
            $(".formulario .ob").each(function() {
                var valor = $(this).val();
                var id = $(this).attr("id");
                var tem = id.search("s2id_");                
                
                if(tem != 0){
                    if (valor == "") {
                        campos = "teste";
                        validaErro(id,"Campo Obrigatório"); 
                        $(".ob:first").focus();
                    }
                }
                if(valor != ""){
                    if($(this).hasClass("senha")){
                       validaSenha(id,valor);
                    }
                    if($(this).hasClass("confirma-senha")){
                       confirma_senha(id,valor);  
                    }
                }
            });
            if (campos != "") { 
                return false;                
            } else {
                return true;                
            }
        }
                       
        $(".deleta_registro .btn-success").click(function(){
            var id = $(this).attr("id");
            var registro = $(".deleta_registro").attr("id");
            $("#load").click();  
            
            $.get(urlValida, {valida: 'deleta_registro', registro: registro, id: id}, function(retorno) {
                    $("#carregando .cancelar").click(); 
                     
                    if(retorno == true){
                        $("#registro-"+id).fadeOut("fast");
                        $(".confirmacao .modal-header").removeClass("btn-bricky").addClass("btn-success");
                        $(".confirmacao .modal-header .modal-title").text("CONFIRMAÇÃO");
                        $(".confirmacao #confirmacao_msg b").html("A exclusão do registro Foi realizada com Sucesso!");
                        $("#confirmacao").click();
                    }else if(retorno != ""){
                         $(".deletando").css("background","#fdfdfd").removeClass("deletando");
                         $(".confirmacao .modal-header").removeClass("btn-success").addClass("btn-bricky");
                         $(".confirmacao .modal-header .modal-title").text("Erro ao Excluir");
                         $(".confirmacao #confirmacao_msg b").html(retorno);
                         $("#confirmacao").click();
                    }else{            
                        $(".deletando").css("background","#fdfdfd").removeClass("deletando");
                        $(".confirmacao .modal-header").removeClass("btn-success").addClass("btn-bricky");
                        $(".confirmacao .modal-header .modal-title").text("Erro ao Excluir");
                        $(".confirmacao #confirmacao_msg b").html("Foi identificado um Erro<br>Favor entrar em contato com o Administrador do Sistema<br>Informando o erro ocorrido.");
                    }
             });
        })                
        
        $(".deleta").click(function(){
            var id = $(this).attr("id");
            $(".deleta_registro .btn-success").attr('id',id);
            $("#registro-"+id).attr("style","").css("background","#ffcccc").addClass("deletando");
        })
        
        $(".cancelar").click(function(){
            $(".deletando").css("background","#fdfdfd").removeClass("deletando");
        })
        
        // FECHA MODAL DE CONFIRMAÇÃO
         $(".confirmacao .btn-success").click(function(){
             location.reload();
         })
        
        // ATIVA E DESATIVA O MENU.
        $(".main-navigation-menu li").click(function(){
            $(".main-navigation-menu").find("li").removeClass("active").removeClass("open");
            $(".main-navigation-menu li ul li").css("display","none");
            $(this).addClass("active");
            $(this).find("li").css("display","block");
        })
        
        // CLASSE QUE DISABILITA O CAMPO
        $(".disabilita").attr("disabled",true);   
       
        // ABRE MODAL DE LOAD DO SISTEMA
        $("#load").click();
        
        // ABRE MODAL DE CONFIRMAÇÃO DE EMAIL
        $("#emailConfirma").click();
        
        // FECHA MODAL DE LOAD APOS CARREGAR A PÁGINA
	$(window).load(function(){
		$("#carregando .cancelar").click(); 	
	});
});