var Funcoes = function () {
    var inicio = function () {
        
                var home    = servidor_inicial();
                var urlValida = home + 'admin/Ajax.Controller.php';
                
                // Mascaras
                $("#carencia").mask("9?99");               
                $("#codigo").mask("a.99.99?.99");               
                $("#periodicidade").mask("9?99");
                $(".qt").mask("9?99");
                
                $("#nascimento").change(function(){
                    var ano   = $(this).val().substring(6,10);
                    var Hoje     = new Date();
                    var AnoAtual = Hoje.getFullYear();
                    var novoAno  = AnoAtual - 20;

                    if(ano < novoAno){
                        Funcoes.Alerta(Funcoes.MSG01);
                        $(this).val("");
                        return false;
                    }
                });
                $("#carterinha").attr("disabled",true);                
                $.mask.definitions['j'] = "[0-1]"; 
                $("#altura").mask("j,99");
                $("#peso").mask("9?9");
                
                
                // CADASTRO DE CREDENCIADO
                function disabilitaCamposCredenciados(){
                     if($("#tipo").prop('checked')){
                         $("#cnpj").attr("disabled",true).val("");
                         $("#cpf").attr("disabled",false);
                     }else{
                         $("#cpf").attr("disabled",true).val("");
                         $("#cnpj").attr("disabled",false);
                     }
                }

                disabilitaCamposCredenciados();

                // CADASTRO DE CREDENCIADO
                $("#tipo").change(function(){
                    $('#cpf,#cnpj').parent(".form-group").removeClass('has-success has-error');
                    $('span#cpf-info').text("").append('<span class="help-block" id="cpf-info"><i class="fa fa-info-circle"></i> Caso seja Pessoa Fíica</span>');
                    $('span#cnpj-info').text("").append('<span class="help-block" id="cpf-info"><i class="fa fa-info-circle"></i> Caso seja Pessoa Jurídica</span>');
                    disabilitaCamposCredenciados();
                });

                // CRIA MODAL DE VINCULAR VETERINARIO AO CREDENCIADO
                $(".vincula").click(function(){
                    $("#load").click();
                    var id = $(this).attr("id");
                    $(".vincula_veterinario .btn-success").attr('id',id);
                    var cred = $("#registro-" + id + " td:first").text();
                    $(".vincula_veterinario #credencia").text(cred);
                    
                    $.get(urlValida, {valida: 'pesquisa_vinculo_veterinario', cred: id}, function(retorno) {
                           $("#carregando .cancelar").click();               
                           if(retorno == ""){
                               Funcoes.Alerta(Funcoes.MSG02);
                           }else{            
                               $("#veterinario_selecionado option[value="+retorno+"]").attr('selected','selected');
                           }
                    });
                })

                // ENVIA O VINCULO DO VETERINARIO AO CREDENCIADO
                 $(".vincula_veterinario .btn-success").click(function(){
                    var cred = $(this).attr("id");
                    var vet = $("#veterinario_selecionado").val();
                    $("#load").click();

                    $.get(urlValida, {valida: 'vincula_veterinario', cred: cred, vet: vet}, function(retorno) {
                           $("#carregando .cancelar").click();               
                           if(retorno == true){
                               $(".confirmacao .modal-header").removeClass("btn-success").addClass("btn-bricky");
                               $(".confirmacao .modal-header .modal-title").text(Funcoes.MSG_CONFIRMACAO);
                               $(".confirmacao #confirmacao_msg b").html(Funcoes.MSG04);                       
                               $("#confirmacao").click();
                           }else{            
                               Funcoes.Alerta(Funcoes.MSG03);
                           }
                    });
                })

                // VINCULAÇÃO DOS PROCEDIMENTOS AOS CREDENCIADOS // BOTÃO TODOS DA CATEGORIA
                $(".todos").change(function(){
                    var id = $(this).attr("id");
                    var grupo = id.replace("categoria-","");
                    if($(this).prop('checked')){                 
                        $("." + id).prop("checked",true);
                        $(".grupo-" + grupo).slideDown("fast");
                        $(".valor-" + grupo ).each(function() {
                            $(this).addClass("ob");
                        }); 
                        $(".valor-" + grupo +":first").focus();
                    }else{
                        $("." + id).prop("checked",false);
                        $(".grupo-" + grupo).slideUp("fast");
                        $(".valor-" + grupo ).each(function() {
                            $(this).val("").removeClass("ob");
                        });            
                    }
                });

                // VINCULAÇÃO DOS PROCEDIMENTOS AOS CREDENCIADOS
                $(".um").change(function(){ 
                    var id = $(this).attr("id");
                    var todos_cat = true;
                    var todos = $(this).attr("class");           
                    todos = todos.replace(" um","");
                    
                    if(!$(this).prop('checked')){               
                        $("#" + todos).prop("checked",false);
                        $(".form-group-" + id).slideUp("fast");
                        $("#valor-" + id).removeClass("ob").val("");
                    }else{
                        $(".form-group-" + id).removeClass("ob").slideDown("fast");
                        $("#valor-" + id).addClass("ob").focus();
                    }
                    $("." + todos).each(function() { 
                        if(!$(this).prop('checked')){    
                            todos_cat = false;
                        } 
                    });
                    if(todos_cat){
                        $("#" + todos).prop("checked",true);
                    }                     
                });
                
                $(".um").each(function() {
                    if($(this).prop('checked')){    
                        var id = $(this).attr("id");
                        var todos_cat = true;
                        var todos = $(this).attr("class");           
                        todos = todos.replace(" um","");
                        
                        $(".form-group-" + id).removeClass("ob").slideDown("fast");
                        $("#valor-" + id).addClass("ob").focus();
                        
                        $("." + todos).each(function() { 
                            if(!$(this).prop('checked')){    
                                todos_cat = false;
                            } 
                        });
                        if(todos_cat){
                            $("#" + todos).prop("checked",true);
                        }  
                    } 
                });
                
    };
    return {
        init: function () {
            inicio();
        },
        Alerta: function(msg){
            $(".aviso .modal-header").removeClass().addClass("modal-header btn btn-warning");
            $(".aviso #icone").removeClass().addClass("btn btn-yellow");
            $(".aviso i").removeClass().addClass("fa fa-exclamation-triangle");
            $(".aviso .modal-header .modal-title").text("ALERTA");
            $(".aviso #confirmacao_msg b").html(msg);
            $("#aviso").click();
        },
        Sucesso: function(msg){
            $(".aviso .modal-header").removeClass().addClass("modal-header btn btn-success");
            $(".aviso #icone").removeClass().addClass("btn btn-green");
            $(".aviso i").removeClass().addClass("fa fa-check")
            $(".aviso .modal-header .modal-title").text("SUCESSO");
            $(".aviso #confirmacao_msg b").html(msg);
            $("#aviso").click();
        },
        Informativo: function(msg){
            $(".aviso .modal-header").removeClass().addClass("modal-header btn btn-info");
            $(".aviso #icone").removeClass().addClass("btn btn-primary");
            $(".aviso i").removeClass().addClass("fa fa-info-circle");
            $(".aviso .modal-header .modal-title").text("INFORMATIVO");
            $(".aviso #confirmacao_msg b").html(msg);
            $("#aviso").click();
        },
        
        MSG_CONFIRMACAO: "CONFIRMAÇÃO",
        
        MSG01: "Ano menor que o Permitido!",
        MSG02: "Sem Vinculo",
        MSG03: "Erro ao Vincular!",
        MSG04: "A Vinculação do Veterinário ao Credenciado, Foi realizada com Sucesso!",
        
    };
}();

