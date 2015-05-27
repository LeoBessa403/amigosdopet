<?php

class RegiaoModel{
    
    public static function PesquisaRegiaoNome($nome){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::REGIAO_TABELA,"where nome = :nome", "nome={$nome}");
        $result = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function PesquisaRegiaoUF($uf){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::REGIAO_TABELA,"where uf = :uf", "uf={$uf}");
        $result = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function PesquisaRegiaoID($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::REGIAO_TABELA,"where ".Constantes::REGIAO_CHAVE_PRIMARIA." = :id", "id={$id}");
        $result = $pesquisa->getResult();
        return $result;
    }
    
    
}