<?php

class ProcedimentoModel{
    
    public static function CadastraProcedimento(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::PROCEDIMENTO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function PesquisaProcedimento(){
        $tabela = Constantes::PROCEDIMENTO_TABELA." pro"
                . " inner join ".Constantes::CATEGORIA_TABELA." cat"
                . " on pro.".Constantes::CATEGORIA_CHAVE_PRIMARIA." = cat.".Constantes::CATEGORIA_CHAVE_PRIMARIA;
        
        $campos = "pro.*, cat.nome AS nome_procedimento, cat.".Constantes::CATEGORIA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }
        
    public static function PesquisaUmProcedimento($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_TABELA,"where ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function AtualizaProcedimento(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::PROCEDIMENTO_TABELA, $dados, "where ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function DeletaProcedimento($id){
        //VERIFICAR VINCULOS DO PROCEDIMENTO.
        $deleta = new Deleta();
        $deleta->Deletar(Constantes::PROCEDIMENTO_TABELA, "where ".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $deleta->getResult();
    }
    
}