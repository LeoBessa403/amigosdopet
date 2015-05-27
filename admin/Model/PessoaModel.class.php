<?php

class PessoaModel{
    
    public static function CadastraPessoa(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::PESSOA_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function AtualizaPessoa(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::PESSOA_TABELA, $dados, "where ".Constantes::PESSOA_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    
    
    
}