<?php

class CategoriaModel{

    public static function CadastraCategoria(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::CATEGORIA_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function PesquisaCategoria(){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CATEGORIA_TABELA);
        return $pesquisa->getResult();
    }
        
    public static function PesquisaCategoriaVinculadas(){
        $tabela = Constantes::CATEGORIA_TABELA." cat"
                . " inner join ".Constantes::PROCEDIMENTO_TABELA." pro"
                . " on cat.".Constantes::CATEGORIA_CHAVE_PRIMARIA." = pro.".Constantes::CATEGORIA_CHAVE_PRIMARIA;
        
        $campos = "DISTINCT cat.nome , cat.".Constantes::CATEGORIA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,NULL,NULL,$campos);
        return $pesquisa->getResult();
    }
        
    public static function PesquisaUmaCategoria($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CATEGORIA_TABELA,"where ".Constantes::CATEGORIA_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function PesquisaIdCategoria($nome){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CATEGORIA_TABELA,"where nome = :nome","nome={$nome}");
        $result   = $pesquisa->getResult();
        return $result[0][Constantes::CATEGORIA_CHAVE_PRIMARIA];
    }
    
    public static function AtualizaCategoria(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::CATEGORIA_TABELA, $dados, "where ".Constantes::CATEGORIA_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function DeletaCategoria($id){
        //VERIFICA SE TEM ALGUM PROCEDIMENTO VINCULADO A ESSA CATEGORIA.
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_TABELA,"where ".Constantes::CATEGORIA_CHAVE_PRIMARIA." = :id", "id={$id}");
        $result   = $pesquisa->getRegistrosEncontrados();
        
        if($result > 0):
            return "A Categoria Não pode ser excluida! Tem procedimentos dessa categoria.";
        else:
            $deleta = new Deleta();
            $deleta->Deletar(Constantes::CATEGORIA_TABELA, "where ".Constantes::CATEGORIA_CHAVE_PRIMARIA." = :id", "id={$id}");
            return $deleta->getResult();
        endif;   
    }
    
}