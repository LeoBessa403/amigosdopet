<?php

class VendedorModel{
    
    public static function CadastraVendedor(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::CREDENCIADO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
        
    
    public static function AtualizaVendedor(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::CREDENCIADO_TABELA, $dados, "where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function PesquisaVendedor(){
     $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = cre.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::REGIAO_TABELA." reg"
                . " on end.estado = reg.".Constantes::REGIAO_CHAVE_PRIMARIA;
        
        $campos = "cre.".Constantes::CREDENCIADO_CHAVE_PRIMARIA.", pes.nome_razao, pes.cpf_cnpj, dad.tel1, dad.tel2,dad.email, end.cidade, reg.uf";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where vendedor = 'V'",null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmVendedor($id){
        $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = cre.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        if(count($result) > 0):
            $res = $result[0];
        else:
            $res = array();
        endif;
        return $res;
    }
    
    
    public static function DeletaVendedor($id){
        $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = cre.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $campos = "cre.".Constantes::CREDENCIADO_CHAVE_PRIMARIA.", pes.".Constantes::PESSOA_CHAVE_PRIMARIA.", dad.".Constantes::DADOS_CHAVE_PRIMARIA.", end.".Constantes::ENDERECO_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        $deleta = new Deleta();
        foreach ($pesquisa->getResult() as $res):
            $deleta->Deletar(Constantes::DADOS_TABELA, "where ".Constantes::DADOS_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::DADOS_CHAVE_PRIMARIA]}");
            $deleta->Deletar(Constantes::ENDERECO_TABELA, "where ".Constantes::ENDERECO_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::ENDERECO_CHAVE_PRIMARIA]}");
            $deleta->Deletar(Constantes::PESSOA_TABELA, "where ".Constantes::PESSOA_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::PESSOA_CHAVE_PRIMARIA]}");
            $deleta->Deletar(Constantes::CREDENCIADO_TABELA, "where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::CREDENCIADO_CHAVE_PRIMARIA]}");
            return $deleta->getResult();
        endforeach;
    }
    
    public static function PesquisaVendedorSelect(){
        
          $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = cre.".Constantes::PESSOA_CHAVE_PRIMARIA;
             
        $campos = "pes.".Constantes::PESSOA_CHAVE_PRIMARIA." as id, pes.nome_razao as nome, cre.id_credenciado as credenciado";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where vendedor = 'V'",null,$campos);
        return $pesquisa->getResult();
    }
    
}