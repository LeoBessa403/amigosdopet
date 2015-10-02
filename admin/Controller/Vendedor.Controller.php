<?php

class Vendedor{ 
    
    public $result;
    public $resultAlt;
    public $form;
    public $veterinarios;
    public $vendedor;
    public $categorias;
    public $id_cre;
    public $procedimentos;
    public $proc_atendidas;
            
    function CadastroVendedor(){    
        
        $id = "cadastroVendedor";
        
        if(!empty($_POST[$id])):
                       
            $dados = $_POST; 
            $dados['vendedor'] = "V";
            $dados['id_pessoa_fk'] = $dados['id_pessoa_fk'][0];
            if(isset($dados["tipo"]) && $dados["tipo"] != ""):
                $dados["tipo_pessoa"] = "F";
                $dados["cpf_cnpj"] = $dados["cpf"];
            else:
                $dados["tipo_pessoa"] = "J";
                $dados["cpf_cnpj"] = $dados["cnpj"];
            endif;
           
            unset($dados[$id],$dados["cpf"],$dados["cnpj"]); 
        
            if(!empty($_POST['id_vendedor'])):
                    $cred = VendedorModel::PesquisaUmVendedor($_POST['id_vendedor']); 
                    $dados['id_pessoa'] = $cred['id_pessoa'];
                    $pessoa   = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $dado     = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                    $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                    $endereco['estado'] = $dados['id_regiao'][0];                    
                    $dados['id_regiao'] = $cred['id_regiao'];
                    $vendedor = Valida::RecebiVariavel(Constantes::VENDEDOR_CAMPOS, $dados);                    
                             
                    $credenc = VendedorModel::AtualizaVendedor($vendedor, $cred['id_vendedor']);
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
                    
                    $vendedor = Valida::RecebiVariavel(Constantes::CREDENCIADO_CAMPOS, $dados);
                    $vendedor["cadastro"] = Valida::DataDB(Valida::DataAtual());
                    $vendedor["id_regiao"] = $vendedor["id_regiao"][0];
                    
                    $idVendedor = VendedorModel::CadastraVendedor($vendedor);

                    if($idVendedor):
                            $dado = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                            $idDados = DadosModel::CadastraDados($dado);                        

                            $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                            $endereco['estado'] = $vendedor['id_regiao'][0];

                            $idEndereco = EnderecoModel::CadastraEndereco($endereco);

                            if($idEndereco && $idDados):
                                $this->result = $idEndereco;
                            endif;
                    endif;
            endif;
        endif;  
        
        $id_vend = UrlAmigavel::PegaParametro("vend");
        $res = array();
        if($id_vend):
            $res  = VendedorModel::PesquisaUmVendedor($id_vend);
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
        
       $formulario = new Form($id, "admin/Vendedor/CadastroVendedor");
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
                ->setId("fantasia")
                ->setLabel("Nome Fantasia")
                ->setInfo("Nome do Estabelecimento")
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
         
          $vendedores = VendedorModel::PesquisaVendedorSelect();
          
          $vend = array(""=>"Selecione um Responsável");
          foreach ($vendedores as $value) {
              if($id_vend != $value["credenciado"]):
                $vend[$value["id"]] = $value["nome"];
              endif;
          }
          $formulario
                ->setId("id_pessoa_fk")
                ->setType("select") 
                ->setLabel("Vendedor Responsável")
                ->setOptions($vend)
                ->CriaInpunt();
          
          $formulario
                ->setType("textarea") 
                ->setId("observacao")
                ->setLabel("Observação")
                ->CriaInpunt();
              
          if($id_vend):
                $formulario
                        ->setType("hidden")
                        ->setId("id_vendedor")
                        ->setValues($id_vend)
                        ->CriaInpunt();
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarVendedor(){
        
        $this->result = VendedorModel::pesquisaVendedor();
    }    
        
    
}