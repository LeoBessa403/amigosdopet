<?php

class PlanoModel{
      
    public static function CadastraPlano(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::PLANO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function PesquisaPlano(){
        $tabela = Constantes::PLANO_TABELA." pla"
                . " inner join ".Constantes::REGIAO_TABELA." reg"
                . " on pla.".Constantes::REGIAO_CHAVE_PRIMARIA." = reg.".Constantes::REGIAO_CHAVE_PRIMARIA;
        
        $campos = "reg.uf, reg.nome as regiao, pla.*";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }        
    
        
    public static function PesquisaUmPlano($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PLANO_TABELA,"where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function CadastraProcedimentosPlano(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::PROCEDIMENTO_PLANO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function PesquisaIdPlano($nome){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PLANO_TABELA,"where nome = :nome","nome={$nome}");
        $result   = $pesquisa->getResult();
        return $result[0][self::chave_primaria];
    }
    
     public static function PesquisaProcedimentoInclusoPlano($id_pla,$id_proc){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_PLANO_TABELA,"where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id_pla and ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id_proc","id_pla={$id_pla}&id_proc={$id_proc}");
        return $pesquisa->getResult();
    }
    
    public static function AtualizaProcedimentoInclusoPlano(array $dados,$id_pla,$id_proc){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::PROCEDIMENTO_PLANO_TABELA, $dados,"where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id_pla and ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id_proc","id_pla={$id_pla}&id_proc={$id_proc}");
        return $atualiza->getResult();
    }
    
     public static function DeletaProcedimentoPlano($id_pla,$id_proc){   
        $deleta = new Deleta();       
        $deleta->Deletar(Constantes::PROCEDIMENTO_PLANO_TABELA,"where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id_pla and ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id_proc","id_pla={$id_pla}&id_proc={$id_proc}");
        return $deleta->getResult();      
    }
    
    public static function AtualizaPlano(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::PLANO_TABELA, $dados, "where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function DeletaPlano($id){
        //VERIFICA SE TEM ALGUM CLIENTE VINCULADO A ESSA PLANO.
//        $pesquisa = new Pesquisa();
//        $pesquisa->Pesquisar(ProcedimentoModel::tabela,"where ".self::chave_primaria." = :id", "id={$id}");
//        $result   = $pesquisa->getRegistrosEncontrados();
//        
//        if($result > 0):
//            return "A Plano Não pode ser excluida! Tem procedimentos dessa plano.";
//        else:
            $deleta = new Deleta();
            $deleta->Deletar(Constantes::PLANO_TABELA, "where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id", "id={$id}");
            return $deleta->getResult();
       // endif;   
    }
    
     public static function PesquisaTodosProcedimentosPlano($id_pla){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_PLANO_TABELA,"where ".Constantes::PLANO_CHAVE_PRIMARIA." = :id_pla","id_pla={$id_pla}");
        return $pesquisa->getResult();
    }
    
    
}