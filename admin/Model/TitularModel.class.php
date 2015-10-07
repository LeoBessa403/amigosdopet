<?php

class TitularModel{
      
    public static function PesquisaTitular(){
        $tabela = Constantes::PESSOA_TABELA." pes"
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $campos = "pes.nome_razao, dad.tel1, dad.tel2, end.cidade, end.estado, pes.id_pessoa";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where pes.cliente = 'C'",null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaTitularSelect(){
        $campos = "id_pessoa, nome_razao";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PESSOA_TABELA,"where cliente = 'C'",null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmTitular($id){
      $tabela = Constantes::PESSOA_TABELA." pes"
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function DeletaTitular($id){
        if(Valida::ValPerfil("EdicaoTitular")):
            $tabela = Constantes::PESSOA_TABELA." pes"
                    . " inner join ".Constantes::DADOS_TABELA." dad"
                    . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                    . " inner join ".Constantes::ENDERECO_TABELA." end"
                    . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;

            $campos = "pes.id_pessoa, dad.id_dados, end.id_endereco";

            $pesquisa = new Pesquisa();
            $pesquisa->Pesquisar($tabela,"where pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = :id","id={$id}",$campos);
            $deleta = new Deleta();
            foreach ($pesquisa->getResult() as $res):
                $deleta->Deletar(Constantes::DADOS_TABELA, "where ".Constantes::DADOS_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::DADOS_CHAVE_PRIMARIA]}");
                $deleta->Deletar(Constantes::ENDERECO_TABELA, "where ".Constantes::ENDERECO_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::ENDERECO_CHAVE_PRIMARIA]}");
                $deleta->Deletar(Constantes::PESSOA_TABELA, "where ".Constantes::PESSOA_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::PESSOA_CHAVE_PRIMARIA]}");           
                return $deleta->getResult();
            endforeach;
        endif;
    }   
    
    
}