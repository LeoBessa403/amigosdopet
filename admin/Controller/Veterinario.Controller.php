<?php

class Veterinario{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroVeterinario(){    
        
        $id = "cadastroVeterinario";
        
        if(!empty($_POST[$id])):
                       
            $dados = $_POST;    
            $dados['cliente'] = "";
            $dados["id_regiao"] = $_POST["id_regiao"][0];
            if(isset($dados["tipo"]) && $dados["tipo"] != ""):
                $dados["tipo_pessoa"] = "F";
                $dados["cpf_cnpj"] = $dados["cpf"];
            else:
                $dados["tipo_pessoa"] = "J";
                $dados["cpf_cnpj"] = $dados["cnpj"];
            endif;

            unset($dados[$id],$dados["cpf"],$dados["cnpj"]); 
        
            if(!empty($_POST['id_veterinario'])):
               
                    $veter = VeterinarioModel::PesquisaUmVeterinario($_POST['id_veterinario']); 
                    $dados['id_pessoa'] = $veter['id_pessoa'];
                    $dados["tel0800"] = "";
                    $dados["tel3"] = "";
                    $pessoa   = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $dado     = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                    $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                    $endereco['estado'] = $dados['id_regiao'][0];                    
                    $dados['id_regiao'] = $veter['id_regiao'];
                    $veterinario = Valida::RecebiVariavel(Constantes::VETERINARIO_CAMPOS, $dados);                    
                             
                    $veterina = VeterinarioModel::AtualizaVeterinario($veterinario, $veter['id_veterinario']);
                    $pess  = PessoaModel::AtualizaPessoa($pessoa, $veter['id_pessoa']);
                    $dad   = DadosModel::AtualizaDados($dado, $veter['id_dados']);
                    $end   = EnderecoModel::AtualizaEndereco($endereco, $veter['id_endereco']);
                    
                    if($veterina && $pess && $dad && $end):
                       $this->resultAlt = true;
                    endif;
            else:
                 
                    $pessoa = Valida::RecebiVariavel(Constantes::PESSOA_CAMPOS, $dados);
                    $idPessoa = PessoaModel::CadastraPessoa($pessoa);
                    $dados['id_pessoa'] = $idPessoa;
                    
                    $veterinario = Valida::RecebiVariavel(Constantes::VETERINARIO_CAMPOS, $dados);
                    $veterinario["cadastro"] = Valida::DataDB(Valida::DataAtual());
                  
                    $idVeterinario = VeterinarioModel::CadastraVeterinario($veterinario);

                    if($idVeterinario):
                            $dados["tel0800"] = "";
                            $dados["tel3"] = "";
                            $dado = Valida::RecebiVariavel(Constantes::DADOS_CAMPOS, $dados);
                            $idDados = DadosModel::CadastraDados($dado);                        

                            $endereco = Valida::RecebiVariavel(Constantes::ENDERECO_CAMPOS, $dados);
                            $regiao = RegiaoModel::PesquisaRegiaoID($dados["id_regiao"]);
                            $endereco['estado'] = $regiao[0]['uf'];

                            $idEndereco = EnderecoModel::CadastraEndereco($endereco);

                            if($idEndereco && $idDados):
                                $this->result = $idEndereco;
                            endif;
                    endif;
            endif;
        endif;
        
        $id_vet = UrlAmigavel::PegaParametro("vet");
        $res = array();
        if($id_vet):
            $res = VeterinarioModel::PesquisaUmVeterinario($id_vet);
        endif;   
        
        $checked = "checked";
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
        
       $formulario = new Form($id, "admin/Veterinario/CadastroVeterinario");
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
                ->setTamanhoInput(6)   
                ->setIcon("fa fa-phone")
                ->setLabel("Telefone Comercial")
                ->setClasses("tel ob")
                ->CriaInpunt();

         $formulario
                ->setId("tel2")
                 ->setTamanhoInput(6) 
                 ->setIcon("fa fa-mobile-phone")
                ->setLabel("Telefone Celular")
                ->setClasses("tel")
                ->CriaInpunt();
         
           $formulario
                ->setId("crmv")
                ->setLabel("CRMV")
                ->setIcon("fa-credit-card fa")
                ->setInfo("Registro Nacional")
                ->setTamanhoInput(4) 
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
        
          if($id_vet):
                $formulario
                        ->setType("hidden")
                        ->setId("id_veterinario")
                        ->setValues($id_vet)
                        ->CriaInpunt();
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarVeterinario(){
        
        $this->result = VeterinarioModel::PesquisaVeterinario();
    }
}