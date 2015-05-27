<?php

class Titular{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroTitular(){    
        
        $id = "cadastroTitular";
        
        if(!empty($_POST[$id])):
            
            $dados = $_POST; 
            $dados['cliente'] = "C";
            $dados["tipo_entidade"] = "C";
            if(isset($dados["tipo"]) && $dados["tipo"] != ""):
                $dados["tipo_pessoa"] = "F";
                $dados["cpf_cnpj"] = $dados["cpf"];
            else:
                $dados["tipo_pessoa"] = "J";
                $dados["cpf_cnpj"] = $dados["cnpj"];
            endif;

            unset($dados[$id],$dados["cpf"],$dados["cnpj"]); 
        
            if(!empty($_POST['id_pessoa'])):
                
                    $client = TitularModel::PesquisaUmTitular($_POST['id_pessoa']);
                    $dados[Constantes::PESSOA_CHAVE_PRIMARIA] = $client[Constantes::PESSOA_CHAVE_PRIMARIA];
                    $pessoa   = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $dado     = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                    $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                    $endereco['estado'] = $dados['estado'][0];
                    
                    $pess  = PessoaModel::AtualizaPessoa($pessoa, $client['id_pessoa']);
                    $dad   = DadosModel::AtualizaDados($dado, $client['id_dados']);
                    $end   = EnderecoModel::AtualizaEndereco($endereco, $client['id_endereco']);
                    
                    if($pess && $dad && $end):
                        $this->resultAlt = true;
                    endif;
            else:
                                       
                    $pessoa = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);                    
                    
                    $idPessoa = PessoaModel::cadastraPessoa($pessoa);
                    $dados[Constantes::PESSOA_CHAVE_PRIMARIA] = $idPessoa;

                    if($idPessoa):
                            $dado = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                            $idDados = DadosModel::CadastraDados($dado); 
                            $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                            $endereco['estado'] = $dados['estado'][0];

                            $idEndereco = EnderecoModel::CadastraEndereco($endereco);

                            if($idEndereco && $idDados):
                                $this->result = $idEndereco;
                            endif;

                    endif;
            endif;
        endif;
        
        $id_cli = UrlAmigavel::PegaParametro("cli");
        $res = array();
        if($id_cli):
            $res = TitularModel::PesquisaUmTitular($id_cli);
        endif;
        
        $checked = "checked";
        if(!empty($res)):
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
        
        
       $formulario = new Form($id, "admin/Titular/CadastroTitular");
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
                ->setLabel("Nome / Razão")
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

         $formulario
                ->setId("endereco")  
                ->setIcon("fa-envelope-o fa") 
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

         $options = array("AL"=>"Alagoas", "DF"=>"Distrito Federal","AC"=>"Acre", "AM"=>"Amazonas", 
             "AP"=>"Amapá","BA"=>"Bahia","CE"=>"Ceará","ES"=>"Espírito Santo","GO"=>"Goiás","MA"=>"Maranhão",
             "MT"=>"Mato Grosso","MS"=>"Mato Grosso do Sul","MG"=>"Minas Gerais","PA"=>"Pará","PB"=>"Paraíba",
             "PR"=>"Paraná","PE"=>"Pernambuco","PI"=>"Piauí","RJ"=>"Rio de Janeiro","RN"=>"Rio Grande do Norte",
             "RO"=>"Rondônia","RS"=>"Rio Grande do Sul","RR"=>"Roraima","SC"=>"Santa Catarina","SE"=>"Sergipe",
             "SP"=>"São Paulo","TO"=>"Tocantins");
         $formulario
                ->setTamanhoInput(8)
                 ->setId("estado")
                ->setType("select")  
                ->setLabel("Estado")
                ->setOptions($options)
                ->CriaInpunt();         

         $formulario
                ->setId("tel1")
                ->setTamanhoInput(4)   
                ->setIcon("fa fa-phone")
                ->setLabel("Telefone Celular")
                ->setClasses("tel ob")
                ->CriaInpunt();

         $formulario
                ->setId("tel2")
                 ->setTamanhoInput(4) 
                 ->setIcon("fa fa-mobile-phone")
                ->setLabel("Telefone Residencial")
                ->setClasses("tel")
                ->CriaInpunt();

         $formulario
                ->setId("tel3")
                 ->setTamanhoInput(4) 
                 ->setIcon("fa fa-phone")
                ->setLabel("Telefone da Empresa")
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

             
          if($id_cli):
                $formulario
                        ->setType("hidden")
                        ->setId("id_pessoa")
                        ->setValues($id_cli)
                        ->CriaInpunt();
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarTitular(){
        
        $this->result = TitularModel::PesquisaTitular();
    }
}