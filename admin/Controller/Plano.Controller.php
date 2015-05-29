<?php

class Plano{ 
    
    public $result;
    public $resultAlt;
    public $form;
    public $id_pla;
    public $plano;
    public $proc_plano;
    
    function CadastroPlano(){    
        
        $id = "cadastroPlano";
        
        if(!empty($_POST[$id])):
            
            $dados = $_POST; 
            $dados['preco'] = Valida::formataMoedaBanco($dados['preco']); 
            $dados['id_regiao'] =  $dados['id_regiao'][0];
            
            unset($dados[$id]); 
        
            if(!empty($_POST['id_plano'])):
                    
                    $idPlano = PlanoModel::AtualizaPlano($dados, $_POST['id_plano']);
                    if($idPlano):
                        $this->resultAlt = true;
                    endif;
            else:    
                    $idPlano = PlanoModel::CadastraPlano($dados);
                    if($idPlano):
                        $this->result = $idPlano;
                    endif;
            endif;
        endif;
        
        $id_pla = UrlAmigavel::PegaParametro("pla");
        $res = array();
        if($id_pla):
            $res = PlanoModel::PesquisaUmPlano($id_pla);
            $res['preco'] = Valida::formataMoeda($res['preco']);
        endif;
               
        
       $formulario = new Form($id, "admin/Plano/CadastroPlano");
       $formulario->setValor($res);
             
       

        $formulario
                ->setId("nome")
                ->setLabel("Nome")
                ->setClasses("ob")
                ->setInfo("Nome do Plano")
                ->CriaInpunt();        

        $formulario
                ->setId("preco")
                ->setTamanhoInput(6)
                ->setLabel("Preço") 
                ->setClasses("moeda ob")
                ->setInfo("Valor Total do Plano")
                ->CriaInpunt();

         $formulario
                ->setTamanhoInput(6)
                ->setId("id_regiao")
                ->setType("select") 
                 ->setClasses("ob")
                ->setLabel("Estado")
                ->setAutocomplete("tb_regiao", "uf","id_regiao")
                ->CriaInpunt();
             
          if($id_pla):
                $formulario
                        ->setType("hidden")
                        ->setId("id_plano")
                        ->setValues($id_pla)
                        ->CriaInpunt();
          endif;
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarPlano(){
        
        // CADASTRA OS PROCEDIMENTOS VINCULADOS AO CREDENCIADO
        if(!empty($_POST['vincula-procedimentos-plano'])):
            $dados = $_POST;
            $proc['id_plano'] = $dados["id_plano"];
            unset($dados["id_plano"],$dados['vincula-procedimentos-plano']);
            $ok = "";
            $proc_plano = PlanoModel::PesquisaTodosProcedimentosPlano($proc['id_plano']); 
            $proc_ja_atendidos = array();
            foreach ($proc_plano as $key => $value) {            
                $proc_ja_atendidos[$value['id_procedimento']] = $value['quantidade'];
            } 
            
            foreach ($dados as $key => $value) {
                if($value != ""): 
                    if(strpos($key,"valor-") !== false):                        
                        $proc['id_procedimento'] = str_replace("valor-", "", $key);
                        $proc['quantidade'] = $value;                        
                      
                        if(array_key_exists($proc['id_procedimento'], $proc_ja_atendidos)):
                            unset($proc_ja_atendidos[$proc['id_procedimento']]);
                        endif;
                        
                        $cadastrado = PlanoModel::PesquisaProcedimentoInclusoPlano($proc['id_plano'], $proc['id_procedimento']);
                        if(empty($cadastrado)):
                            $ok = PlanoModel::CadastraProcedimentosPlano($proc);
                        else:
                            $quantidade['quantidade'] = $proc['quantidade'];
                            $ok = PlanoModel::AtualizaProcedimentoInclusoPlano($quantidade, $proc['id_plano'], $proc['id_procedimento']);
                        endif;
                    endif;
                endif;
            }
           
            foreach ($proc_ja_atendidos as $id => $nao) {
                PlanoModel::DeletaProcedimentoPlano($proc['id_plano'], $id);
            }
            
            $this->result = $ok;
        endif;
        
        $this->result = PlanoModel::PesquisaPlano();
    }
    
    function ProcedimentosPlano(){
           
        $id = "procedimentosPlano";
        
        $this->id_pla         = UrlAmigavel::PegaParametro("pla");        
        $this->plano          = PlanoModel::PesquisaUmPlano($this->id_pla); 
        $this->procedimentos  = ProcedimentoModel::PesquisaProcedimento();
        $this->categorias     = CategoriaModel::PesquisaCategoriaVinculadas();
        $proc_plano           = PlanoModel::PesquisaTodosProcedimentosPlano($this->id_pla);
        $this->proc_plano     = array();
        
        foreach ($proc_plano as $key => $value) {            
            $this->proc_plano[$value['id_procedimento']] = $value['quantidade'];
        }        
    }
    
    function ListarProcedimentosPlano(){
           
        $id_pla             = UrlAmigavel::PegaParametro("pla");    
        $this->result       = PlanoModel::PesquisaTodosProcedimentosPlanosAtendidos($id_pla);
        $this->plano        = PlanoModel::PesquisaUmPlano($id_pla);
    }
}