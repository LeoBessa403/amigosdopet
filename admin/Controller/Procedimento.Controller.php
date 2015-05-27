<?php

class Procedimento{ 
    
    public $result;
    public $resultAlt;
    public $form;
    
    function CadastroProcedimento(){    
        
        $id = "cadastroProcedimento";
        
       if(!empty($_POST[$id])):
            
           $dados = $_POST;
           unset($dados[$id]);
           
           if(!empty($_POST['id_procedimento'])):
               $dados[Constantes::CATEGORIA_CHAVE_PRIMARIA] = $dados[Constantes::CATEGORIA_CHAVE_PRIMARIA][0];
               $procedimento = Valida::RecebiVariavel(Constantes::PROCEDIMENTO_CAMPOS, $dados);
               $procedimento2 = ProcedimentoModel::AtualizaProcedimento($procedimento, $_POST['id_procedimento']);
               if($procedimento2):
                       $this->resultAlt = true;
               endif;
           else:
               $dados[Constantes::CATEGORIA_CHAVE_PRIMARIA] = $dados[Constantes::CATEGORIA_CHAVE_PRIMARIA][0];
               $procedimento = Valida::RecebiVariavel(Constantes::PROCEDIMENTO_CAMPOS, $dados);
               $this->result = ProcedimentoModel::CadastraProcedimento($procedimento);
           endif;
       endif;
       
        $id_pro = UrlAmigavel::PegaParametro("pro");
        $res = array();
        if($id_pro):
            $res = ProcedimentoModel::PesquisaUmProcedimento($id_pro);
        endif;
        
        
       $formulario = new Form($id, "admin/Procedimento/CadastroProcedimento");
       $formulario->setValor($res);
             
      $formulario
              ->setId("nome")
              ->setClasses("ob")
              ->setIcon("fa-stethoscope fa")
              ->setLabel("Procedimento")
              ->CriaInpunt();
      
      $formulario
              ->setType("select")
              ->setClasses("ob")
              ->setIcon("clip-list")
              ->setId("id_categoria")
              ->setAutocomplete(Constantes::CATEGORIA_TABELA, "nome", Constantes::CATEGORIA_CHAVE_PRIMARIA)
              ->setLabel("Categoria")
              ->CriaInpunt();
      
      $formulario
              ->setId("carencia")
              ->setInfo("Dias!")
              ->setClasses("ob")
              ->setIcon("clip-calendar-3")
              ->setLabel("Carência")
              ->setTamanhoInput("4")
              ->CriaInpunt();
      
      $formulario
              ->setId("periodicidade")
              ->setLabel("Periodicidade")
              ->setInfo("Dias!")
              ->setClasses("ob")
              ->setIcon("clip-calendar-3")
              ->setTamanhoInput("4")
              ->CriaInpunt();
      
      $formulario
              ->setId("codigo")
              ->setIcon("clip-popout")
              ->setLabel("Código")
              ->setClasses("ob")
              ->setInfo("Código Padrão CRMV!")
              ->setTamanhoInput("4")
              ->CriaInpunt();
      
      if($id_pro):
            $formulario
                    ->setType("hidden")
                    ->setId("id_procedimento")
                    ->setValues($id_pro)
                    ->CriaInpunt();
      endif;
      
        
        $this->form = $formulario->finalizaForm(); 
    }
    
    function ListarProcedimento(){
        
        $this->result = ProcedimentoModel::PesquisaProcedimento();
    }
    
    function ExportarProcedimento() {
        
        $formato = UrlAmigavel::PegaParametro("formato");
        $result = ProcedimentoModel::PesquisaProcedimento();
        $i = 0;
        foreach ($result as $value) {
            $res[$i]['codigo'] = $value['codigo'];
            $res[$i]['nome'] = $value['nome'];
            $res[$i]['nome_procedimento'] = $value['nome_procedimento'];
            $res[$i]['carencia'] = $value['carencia'];
            $res[$i]['periodicidade'] = $value['periodicidade'];
            $i++;
        }
        $Colunas = array('Código','Nome','Categoria','Carência','Periodicidade');
        $exporta = new Exportacao($formato, "Relatório de Acesso");
       // $exporta->setPapelOrientacao("paisagem");
        $exporta->setColunas($Colunas);
        $exporta->setConteudo($res);
        $exporta->GeraArquivo();
       
    }
}