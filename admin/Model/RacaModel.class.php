<?php

class RacaModel{
    
    public static function CadastraRaca(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::RACA_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function PesquisaRaca(){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::RACA_TABELA);
        return $pesquisa->getResult();
    }
        
    public static function PesquisaRacaVinculadas(){
        $tabela = Constantes::RACA_TABELA." cat"
                . " inner join ".Constantes::PROCEDIMENTO_TABELA." pro"
                . " on cat.".Constantes::RACA_CHAVE_PRIMARIA." = pro.".Constantes::RACA_CHAVE_PRIMARIA;
        
        $campos = "DISTINCT cat.nome , cat.".Constantes::RACA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,NULL,NULL,$campos);
        return $pesquisa->getResult();
    }
        
    public static function PesquisaUmaRaca($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::RACA_TABELA,"where ".Constantes::RACA_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function PesquisaIdRaca($nome){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::RACA_TABELA,"where nome = :nome","nome={$nome}");
        $result   = $pesquisa->getResult();
        return $result[0][Constantes::RACA_CHAVE_PRIMARIA];
    }
    
    public static function AtualizaRaca(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::RACA_TABELA, $dados, "where ".Constantes::RACA_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function DeletaRaca($id){
        //VERIFICA SE TEM ALGUM ANIMAL VINCULADO A ESSA RACA.
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CLIENTE_TABELA,"where ".Constantes::RACA_CHAVE_PRIMARIA." = :id", "id={$id}");
        $result   = $pesquisa->getRegistrosEncontrados();
        
        if($result > 0):
            return "A Raca Não pode ser excluida! Tem Clientes dessa raca.";
        else:
            $deleta = new Deleta();
            $deleta->Deletar(Constantes::RACA_TABELA, "where ".Constantes::RACA_CHAVE_PRIMARIA." = :id", "id={$id}");
            return $deleta->getResult();
        endif;   
    }
    
}