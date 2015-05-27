<?php

class EnderecoModel{
    
    public static function CadastraEndereco(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::ENDERECO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function AtualizaEndereco(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::ENDERECO_TABELA, $dados, "where ".Constantes::ENDERECO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    
    
}