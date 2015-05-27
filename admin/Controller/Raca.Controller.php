<?php

class Raca{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroRaca(){    
        
        $id = "cadastroRaca";
        
       if(!empty($_POST[$id])):
            
           $dados = $_POST;
           unset($dados[$id]);
           
           if(!empty($_POST['id_raca'])):
               $raca = Valida::RecebiVariavel(Constantes::RACA_CAMPOS, $dados);
               $raca2 = RacaModel::AtualizaRaca($raca, $_POST['id_raca']);
               if($raca2):
                       $this->resultAlt = true;
               endif;
           else:
               $this->result = RacaModel::CadastraRaca($dados);
           endif;
       endif;
       
        $id_rac = UrlAmigavel::PegaParametro("rac");
        $res = array();
        if($id_rac):
            $res = RacaModel::PesquisaUmaRaca($id_rac);
        endif;
        
        
       $formulario = new Form($id, "admin/Raca/CadastroRaca");
       $formulario->setValor($res);
             
      $formulario
              ->setId("raca")
              ->setClasses("ob")
              ->setLabel("Raca")
              ->CriaInpunt();
      
      if($id_rac):
            $formulario
                    ->setType("hidden")
                    ->setId("id_raca")
                    ->setValues($id_rac)
                    ->CriaInpunt();
      endif;
      
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarRaca(){
        
        $this->result = RacaModel::PesquisaRaca();
    }
}