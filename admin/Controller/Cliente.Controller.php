<?php

class Cliente{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroCliente(){    
                
        $id = "cadastroCliente";
        
        if(!empty($_POST[$id])):
            
            $dados = $_POST; 
            unset($dados[$id]); 
            if(!empty($dados['cor'])):
                $dados['cor']       = implode(",", $dados['cor']);
            endif;
            $dados['especie']   = $dados['especie'][0];
            $dados['porte']     = $dados['porte'][0];
            $dados['sexo']      = $dados['sexo'][0];
            $dados['id_raca']   = $dados['id_raca'][0];
            $dados['id_pessoa']   = $dados['id_pessoa'][0];
        
            if(!empty($_POST['id_cliente'])):
                
                $id = $dados['id_cliente'];
                unset($dados['id_cliente']);
                
                $ok = ClienteModel::AtualizaCliente($dados, $id);
                    
                if($ok):
                    $this->resultAlt = true;
                endif;
            else:

                $dados['cadastro']  = Valida::DataDB(Valida::DataAtual('d/m/Y'));

                $id = ClienteModel::CadastraCliente($dados);                
                if($id):
                    $atu['carterinha']  = (Valida::DataAtual('Ym') * 10000) + $id + 100;
                    $ok = ClienteModel::AtualizaCliente($atu, $id);
                    if($ok):
                        if($_FILES['fotos']['name'][0]){
                            $upload = new Upload();
                            $pasta = "cliente/".$id."/";
                            $arquivos = $upload->UploadMultiplasImagens($_FILES['fotos'],$dados['nome'],$pasta);
                            $foto['id_cliente'] =  $id;

                            foreach ($arquivos as $value) {
                                $foto['caminho'] = $pasta.$value;
                                FotoModel::CadastraFoto($foto);
                            }                        
                         }
                        $this->result = true;
                    endif;
                endif;
            endif;
        endif;
        
        $id_cli = UrlAmigavel::PegaParametro("cli");
        $res = array();
        $limite = 0;
        if($id_cli):
            $res = ClienteModel::PesquisaUmCliente($id_cli);
            $res['cor'] = explode(",",$res['cor']);
            $fotos = ClienteModel::PesquisaFotosUmCliente($id_cli);
            $limite = 5 - count($fotos);
        endif;   
        
       $formulario = new Form($id, "admin/Cliente/CadastroCliente");
       $formulario->setValor($res);
       
        $titulares = TitularModel::PesquisaTitularSelect();
          $titul = array(""=>"Selecione um Dono");
          foreach ($titulares as $value) {
              $titul[$value["id_pessoa"]] = $value["nome_razao"];
          }
          $formulario
                ->setId("id_pessoa")
                ->setType("select") 
                ->setLabel("Responsável pelo Cliente")
                ->setClasses("ob")
                ->setOptions($titul)
                ->CriaInpunt();
             
        $formulario
                ->setId("nome")
                ->setLabel("Nome")
                ->setClasses("ob")
                ->setInfo("Nome do Cliente")
                ->CriaInpunt();

        $options = array("Branco"=>"Branco", "Marrom"=>"Marrom","Preto"=>"Preto","Cinza"=>"Cinza");
         $formulario
                ->setClasses("multipla")
                ->setId("cor")
                ->setType("select") 
                ->setInfo("Uma ou mais Cores")
                ->setLabel("Cor")
                ->setOptions($options)
                ->CriaInpunt(); 
         
         $options = array("Cachorro"=>"Cachorro", "Gato"=>"Gato");
         $formulario
                ->setTamanhoInput(4)
                ->setId("especie")
                ->setType("select")  
                ->setLabel("Espécie")
                ->setOptions($options)
                ->CriaInpunt(); 
         
         $options = array(""=>"Selecione o Porte","PQ"=>"Pequeno Até 05Kg", "MD"=>"Médio de 5Kg a 10Kg", "GD"=>"Grande Acima de 10Kg");
         $formulario
                ->setTamanhoInput(5)
                 ->setId("porte")
                ->setType("select")  
                ->setLabel("Porte")
                ->setOptions($options)
                ->CriaInpunt();
         
         $formulario
                ->setTamanhoInput(3)
                 ->setId("altura")  
                ->setLabel("Altura (M)")
                ->setInfo("Em Metros")
                ->CriaInpunt(); 
         
         $options = array(""=>"Selecione o Sexo", "M"=>"Macho", "F"=>"Fêmea");
         $formulario
                ->setTamanhoInput(4)
                ->setId("sexo")
                ->setClasses("ob")
                ->setType("select")  
                ->setLabel("Sexo")
                ->setOptions($options)
                ->CriaInpunt(); 
         
           $formulario
                ->setId("peso")
                ->setTamanhoInput(2)
                ->setLabel("Peso (Kg)")
                ->CriaInpunt();
         
          $formulario
                ->setTamanhoInput(6)
                ->setId("id_raca")
                ->setType("select")
                ->setClasses("ob")
                ->setLabel("Raça")
                ->setAutocomplete("tb_raca", "raca","id_raca")
                ->CriaInpunt();
         
           $formulario                
                ->setTamanhoInput(4)
                ->setId("nascimento")
                ->setLabel("Nascimento")
                ->setClasses("ob data")
                ->CriaInpunt();

           $formulario
                ->setId("chip")
                ->setLabel("Nº do Chip") 
                ->setTamanhoInput(8)
                ->CriaInpunt();
           
           $num_fotos = ($limite)? $limite: 5;
           $info = "Até ".$num_fotos." Foto(s)";
           if($num_fotos < 5):
               $info .= ", ".count($fotos)." Já Cadastradas";
           endif;
           $formulario
                ->setId("fotos")
                ->setLabel("Fotos")
                ->setType("file")
                ->setLimite(($limite)? $limite: 5)
                ->setClasses("multipla")
                ->setInfo($info)
                ->CriaInpunt();
           
          if($id_cli):
               $formulario
                    ->setId("carterinha")
                    ->setLabel("Nº da Carterinha") 
                    ->CriaInpunt();
              
                $formulario
                    ->setType("hidden")
                    ->setId("id_cliente")
                    ->setValues($id_cli)
                    ->CriaInpunt();
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarCliente(){
        
        $this->result = ClienteModel::PesquisaCliente();
        
    }
    
     function ExportarCliente() {
        
//        $formato = UrlAmigavel::PegaParametro("formato");
//        $result = ClienteModel::PesquisaCliente();
//        $i = 0;
//        foreach ($result as $value) {
//            $res[$i]['nome_razao'] = $value['nome_razao'];
//            $res[$i]['contatos'] = $value['tel1']." / ".$value['tel2'];
//            $res[$i]['cidade'] = $value['cidade']."-".$value['estado'];
//            $i++;
//        }
//        $Colunas = array('Nome / RazÃ£o Social','Contatos','Cidade');
//        $exporta = new Exportacao($formato, "RelatÃ³rio de Acesso");
//       // $exporta->setPapelOrientacao("paisagem");
//        $exporta->setColunas($Colunas);
//        $exporta->setConteudo($res);
//        $exporta->GeraArquivo();
       
    }
}