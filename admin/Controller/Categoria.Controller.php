<?php

class Categoria{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroCategoria(){    
//         $usuario = new Session();
//         debug($usuario->getUser());
        $id = "cadastroCategoria";
        
       if(!empty($_POST[$id])):
            
           $dados = $_POST;
           unset($dados[$id]);
           
           if(!empty($_POST['id_categoria'])):
               $categoria = Valida::RecebiVariavel(Constantes::CATEGORIA_CAMPOS, $dados);
               $categoria2 = CategoriaModel::AtualizaCategoria($categoria, $_POST['id_categoria']);
               if($categoria2):
                       $this->resultAlt = true;
               endif;
           else:
               $this->result = CategoriaModel::CadastraCategoria($dados);
           endif;
       endif;
       
        $id_cat = UrlAmigavel::PegaParametro("cat");
        $res = array();
        if($id_cat):
            $res = CategoriaModel::PesquisaUmaCategoria($id_cat);
        endif;
        
        
       $formulario = new Form($id, "admin/Categoria/CadastroCategoria");
       $formulario->setValor($res);
             
      $formulario
              ->setId("nome")
              ->setClasses("ob")
              ->setLabel("Categoria")
              ->CriaInpunt();
      
      if($id_cat):
            $formulario
                    ->setType("hidden")
                    ->setId("id_categoria")
                    ->setValues($id_cat)
                    ->CriaInpunt();
      endif;
      
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarCategoria(){
        
        $this->result = CategoriaModel::PesquisaCategoria();
    }
    
    function ExportarCategoria() {
        
        $formato = UrlAmigavel::PegaParametro("formato");
        $result = CategoriaModel::PesquisaCategoria();
        $i = 0;
        foreach ($result as $value) {
            $res[$i]['id_categoria'] = $value['id_categoria'];
            $res[$i]['nome'] = $value['nome'];
            $i++;
        }
        $Colunas = array('Código','Categoria');
        $exporta = new Exportacao($formato, "Relatório de Categorias");
       // $exporta->setPapelOrientacao("paisagem");
        $exporta->setColunas($Colunas);
        $exporta->setConteudo($res);
        $exporta->GeraArquivo();
       
    }
   
}