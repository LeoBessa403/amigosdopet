<?php

class Credenciado{ 
    
    public $result;
    public $resultAlt;
    public $form;
    public $veterinarios;
    public $credenciado;
    public $categorias;
    public $id_cre;
    public $procedimentos;
    public $proc_atendidas;
            
    function CadastroCredenciado(){    
        
        $id = "cadastroCredenciado";
        
        if(!empty($_POST[$id])):
                       
            $dados = $_POST; 
             $dados['cliente'] = "";
            if(isset($dados["tipo"]) && $dados["tipo"] != ""):
                $dados["tipo_pessoa"] = "F";
                $dados["cpf_cnpj"] = $dados["cpf"];
            else:
                $dados["tipo_pessoa"] = "J";
                $dados["cpf_cnpj"] = $dados["cnpj"];
            endif;

            unset($dados[$id],$dados["cpf"],$dados["cnpj"]); 
        
            if(!empty($_POST['id_credenciado'])):
                    $cred = CredenciadoModel::PesquisaUmCredenciado($_POST['id_credenciado']); 
                    $dados['id_pessoa'] = $cred['id_pessoa'];
                    $pessoa   = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $dado     = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                    $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                    $endereco['estado'] = $dados['id_regiao'][0];                    
                    $dados['id_regiao'] = $cred['id_regiao'];
                    $credenciado = Valida::RecebiVariavel(Constantes::CREDENCIADO_CAMPOS, $dados);                    
                             
                    $credenc = CredenciadoModel::AtualizaCredenciado($credenciado, $cred['id_credenciado']);
                    $pess  = PessoaModel::AtualizaPessoa($pessoa, $cred['id_pessoa']);
                    $dad   = DadosModel::AtualizaDados($dado, $cred['id_dados']);
                    $end   = EnderecoModel::AtualizaEndereco($endereco, $cred['id_endereco']);
                    
                    if($credenc && $pess && $dad && $end):
                       $this->resultAlt = true;
                    endif;
            else:
                
                    $pessoa = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $idPessoa = PessoaModel::CadastraPessoa($pessoa);
                    $dados['id_pessoa'] = $idPessoa;
                    
                    $credenciado = Valida::RecebiVariavel(Constantes::CREDENCIADO_CAMPOS, $dados);
                    $credenciado["cadastro"] = Valida::DataDB(Valida::DataAtual());
                    $credenciado["id_regiao"] = $credenciado["id_regiao"][0];
                    
                    $idCredenciado = CredenciadoModel::CadastraCredenciado($credenciado);

                    if($idCredenciado):
                            $dado = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                            $idDados = DadosModel::CadastraDados($dado);                        

                            $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                            $endereco['estado'] = $credenciado['id_regiao'][0];

                            $idEndereco = EnderecoModel::CadastraEndereco($endereco);

                            if($idEndereco && $idDados):
                                $this->result = $idEndereco;
                            endif;
                    endif;
            endif;
        endif;  
        
        $id_cre = UrlAmigavel::PegaParametro("cre");
        $res = array();
        if($id_cre):
            $res  = CredenciadoModel::PesquisaUmCredenciado($id_cre);
            if(isset($res['id_veterinario'])):
                $res2 = VeterinarioModel::PesquisaUmVeterinario($res['id_veterinario']);
                $res['veterinario'] = $res2['nome_razao'];
            endif;
        endif;   
        
        $checked = "";
        if(!empty($res)):
            $res["id_regiao"] = $res["estado"];
            if($res['tipo_pessoa'] == "F"):
                $checked = "checked";
                $res['cpf'] = $res['cpf_cnpj'];
                $res['cnpj'] = "";
            else:
                $checked = "";
                $res['cnpj'] = $res['cpf_cnpj'];
                $res['cpf'] = "";
            endif;
        endif;
        
       $formulario = new Form($id, "admin/Credenciado/CadastroCredenciado");
       $formulario->setValor($res);

       $label_options = array("Física","Jurídica","azul","verde");
        $formulario
                ->setClasses($checked)
                ->setId("tipo")
                ->setType("checkbox")
                ->setLabel("Tipo de Pessoa")
                ->setOptions($label_options)
                ->CriaInpunt();        

        $formulario
                ->setId("nome_razao")
                ->setLabel("Nome ou Razão Social")
                ->setIcon("clip-user-3")
                ->setClasses("ob")
                ->setInfo("Nome da pessoa ou Razão social da empresa")
                ->CriaInpunt();

        $formulario
                ->setId("cpf")
                ->setLabel("CPF") 
                ->setTamanhoInput(6)
                ->setClasses("cpf")
                ->setInfo("Caso seja Pessoa Física")
                ->CriaInpunt();

         $formulario
                ->setId("cnpj")
                ->setLabel("CNPJ")  
                ->setTamanhoInput(6)
                ->setClasses("cnpj")
                ->setInfo("Caso seja Pessoa Jurídica")
                ->CriaInpunt();
         
         $label_options = array("Segunda" => "Segunda","Terça" => "Terça","Quarta" => "Quarta","Quinta" => "Quinta",
                                "Sexta" => "Sexta","Sábado" => "Sábado","Domingo" => "Domingo");
         $formulario
                 ->setId("funcionamento_de")
                 ->setLabel("Dias de Funcionamento de:")
                 ->setType("radio")
                 ->setTamanhoInput(6)
                 ->setLabelCheckRadio($label_options)
                 ->CriaInpunt();
         
         $formulario
                 ->setId("funcionamento_ate")
                 ->setLabel("Até:")
                 ->setType("radio")
                 ->setTamanhoInput(6)
                 ->setLabelCheckRadio($label_options)
                 ->CriaInpunt();
         
         $formulario
                 ->setId("horario_abertura")
                 ->setInfo("Horário de Abertura.")
                  ->setTamanhoInput(6)
                 ->setClasses("horas")
                 ->setIcon("clip-clock-2","dir")
                 ->setLabel("Funcionamento de:")
                 ->CriaInpunt();
       
         $formulario
                 ->setId("horario_fechamento")
                 ->setInfo("Horário de Fechamento.")
                  ->setTamanhoInput(6)
                 ->setIcon("clip-clock-2","dir")
                 ->setClasses("horas")
                 ->setLabel("Até:")
                 ->CriaInpunt();
       

         $formulario
                ->setId("endereco")  
                ->setIcon("clip-home-2") 
                ->setLabel("Endereço")
                ->CriaInpunt();

         $formulario
                ->setId("complemento")
                ->setLabel("Complemento") 
                ->CriaInpunt();

         $formulario
                ->setId("bairro")  
                ->setLabel("Bairro")
                ->CriaInpunt();

         $formulario
                ->setId("cidade")   
                ->setLabel("Cidade")
                ->CriaInpunt();

         $formulario
                ->setId("cep")
                ->setLabel("CEP")  
                ->setTamanhoInput(4)
                ->setClasses("cep")
                ->CriaInpunt();

         //$options = array("DF"=>"Distrito Federal","AC"=>"Acre", "AL"=>"Alagoas", "AM"=>"Amazonas", "AP"=>"Amapá","BA"=>"Bahia","CE"=>"Ceará","ES"=>"Espírito Santo","GO"=>"Goiás","MA"=>"Maranhão","MT"=>"Mato Grosso","MS"=>"Mato Grosso do Sul","MG"=>"Minas Gerais","PA"=>"Pará","PB"=>"Paraíba","PR"=>"Paraná","PE"=>"Pernambuco","PI"=>"Piauí","RJ"=>"Rio de Janeiro","RN"=>"Rio Grande do Norte","RO"=>"Rondônia","RS"=>"Rio Grande do Sul","RR"=>"Roraima","SC"=>"Santa Catarina","SE"=>"Sergipe","SP"=>"São Paulo","TO"=>"Tocantins");
         $formulario
                ->setTamanhoInput(8)
                ->setId("id_regiao")
                ->setType("select") 
                 ->setClasses("ob")
                ->setLabel("Estado")
                ->setAutocomplete(Constantes::REGIAO_TABELA, "uf",  Constantes::REGIAO_CHAVE_PRIMARIA)
                ->CriaInpunt();

         $formulario
                ->setId("tel1")
                ->setTamanhoInput(4)   
                ->setIcon("fa fa-phone")
                ->setLabel("Telefone Comercial")
                ->setClasses("tel ob")
                ->CriaInpunt();

         $formulario
                ->setId("tel2")
                 ->setTamanhoInput(4) 
                 ->setIcon("fa fa-mobile-phone")
                ->setLabel("Telefone Celular")
                ->setClasses("tel")
                ->CriaInpunt();

         $formulario
                ->setId("tel3")
                 ->setTamanhoInput(4) 
                 ->setIcon("fa fa-phone")
                ->setLabel("Telefone Residencial")
                ->setClasses("tel")
                ->CriaInpunt();

         $formulario
                ->setId("tel0800")
                ->setTamanhoInput(4)
                ->setIcon("fa fa-phone")
                ->setLabel("0800 da Empresa")
                ->setClasses("tel0800")
                ->CriaInpunt();

         $formulario
                ->setId("site")
                ->setTamanhoInput(8) 
                 ->setIcon("clip-earth-2")
                ->setLabel("Site")
                ->CriaInpunt();

         $formulario
                ->setId("email")  
                ->setIcon("clip-archive")
                ->setLabel("E-mail")
                ->setClasses("email")
                ->CriaInpunt();

          $formulario
                ->setType("textarea") 
                ->setId("observacao")
                ->setLabel("Observação")
                ->CriaInpunt();
        
          if($id_cre):
                $formulario
                        ->setType("hidden")
                        ->setId("id_credenciado")
                        ->setValues($id_cre)
                        ->CriaInpunt();
                if(isset($res['veterinario'])):
                    $formulario
                        ->setId("veterinario")
                        ->setLabel("Veterinário Responsável")
                        ->setClasses("disabilita")
                        ->CriaInpunt();
                endif;
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarCredenciado(){
        
        // CADASTRA OS PROCEDIMENTOS VINCULADOS AO CREDENCIADO
        if(!empty($_POST['vincula-procedimentos-credenciado'])):
            $dados = $_POST;
            $proc['id_credenciado'] = $dados["id_credenciado"];
            unset($dados["id_credenciado"],$dados['vincula-procedimentos-credenciado']);
            $ok = "";
            $proc_atendidas = CredenciadoModel::PesquisaTodosProcedimentosAtendidosCredenciado($proc['id_credenciado']); 
            $proc_ja_atendidos = array();
            foreach ($proc_atendidas as $key => $value) {            
                $proc_ja_atendidos[$value['id_procedimento']] = $value['preco_apagar'];
            } 
            
            foreach ($dados as $key => $value) {
                if($value != ""):                    
                    if(strpos($value,"R$") !== false):
                        $proc['id_procedimento'] = str_replace("valor-", "", $key);
                        $proc['preco_apagar'] = Valida::formataMoedaBanco($value);
                        
                        if(array_key_exists($proc['id_procedimento'], $proc_ja_atendidos)):
                            unset($proc_ja_atendidos[$proc['id_procedimento']]);
                        endif;
                        
                        $cadastrado = CredenciadoModel::PesquisaProcedimentoAtendidoCredenciado($proc['id_credenciado'], $proc['id_procedimento']);
                        if(empty($cadastrado)):
                            $ok = CredenciadoModel::CadastraProcedimentosAtendidosCredenciado($proc);
                        else:
                            $valor['preco_apagar'] = $proc['preco_apagar'];
                            $ok = CredenciadoModel::AtualizaProcedimentoAtendidoCredenciado($valor, $proc['id_credenciado'], $proc['id_procedimento']);
                        endif;
                    endif;
                endif;
            }
           
            foreach ($proc_ja_atendidos as $id => $nao) {
                CredenciadoModel::DeletaProcedimentoCredenciado($proc['id_credenciado'], $id);
            }
            
            $this->result = $ok;
        endif;
        
        $this->result = CredenciadoModel::pesquisaCredenciado();
        $this->veterinarios = VeterinarioModel::PesquisaVinculaVeterinario();
    }    
        
    function ProcedimentosAtendidos(){
           
        $id = "procedimentosAtendidos";
        
        $this->id_cre         = UrlAmigavel::PegaParametro("cre");        
        $this->credenciado    = CredenciadoModel::PesquisaRazaoCredenciadoId($this->id_cre); 
        $this->procedimentos  = ProcedimentoModel::PesquisaProcedimento();
        $this->categorias     = CategoriaModel::PesquisaCategoriaVinculadas();
        $proc_atendidas       = CredenciadoModel::PesquisaTodosProcedimentosAtendidosCredenciado($this->id_cre); 
        $this->proc_atendidas = array();
        
        foreach ($proc_atendidas as $key => $value) {            
            $this->proc_atendidas[$value['id_procedimento']] = $value['preco_apagar'];
        }        
    }
    
    function ProcedimentosVinculados(){
           
        $id = "procedimentosAtendidos";
        
        $id_cre         = UrlAmigavel::PegaParametro("cre");        
        $this->result   = CredenciadoModel::PesquisaTodosProcedimentosCredenciado($id_cre);
        $this->credenciado = CredenciadoModel::PesquisaUmCredenciado($id_cre);
    }
    
}