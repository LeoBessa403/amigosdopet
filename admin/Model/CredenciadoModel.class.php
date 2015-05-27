<?php

class CredenciadoModel{
    
    public static function CadastraCredenciado(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::CREDENCIADO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function CadastraProcedimentosAtendidosCredenciado(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::PROCEDIMENTO_CREDENCIADO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function AtualizaProcedimentoAtendidoCredenciado(array $dados,$id_cre,$id_proc){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::PROCEDIMENTO_CREDENCIADO_TABELA, $dados,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id_cre and id_procedimento = :id_proc","id_cre={$id_cre}&id_proc={$id_proc}");
        return $atualiza->getResult();
    }
    
    public static function PesquisaProcedimentoAtendidoCredenciado($id_cre,$id_proc){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_CREDENCIADO_TABELA,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id_cre and id_procedimento = :id_proc","id_cre={$id_cre}&id_proc={$id_proc}");
        return $pesquisa->getResult();
    }
    
    public static function PesquisaTodosProcedimentosAtendidosCredenciado($id_cre){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::PROCEDIMENTO_CREDENCIADO_TABELA,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id_cre","id_cre={$id_cre}");
        return $pesquisa->getResult();
    }
    
    public static function PesquisaTodosProcedimentosCredenciado($id_cre){
        $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PROCEDIMENTO_CREDENCIADO_TABELA." procre"
                . " on cre.".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = procre.".Constantes::CREDENCIADO_CHAVE_PRIMARIA
                . " inner join ".Constantes::PROCEDIMENTO_TABELA." pro"
                . " on pro.".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA." = procre.".Constantes::PROCEDIMENTO_CHAVE_PRIMARIA
                . " inner join ".Constantes::CATEGORIA_TABELA." cat"
                . " on pro.".Constantes::CATEGORIA_CHAVE_PRIMARIA." = cat.".Constantes::CATEGORIA_CHAVE_PRIMARIA;
        
        
        $campos = "cat.nome as categoria, pro.*, procre.preco_apagar as valor";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where procre.".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id_cre}",$campos);
        return $pesquisa->getResult();
    }
    
    public static function AtualizaCredenciado(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::CREDENCIADO_TABELA, $dados, "where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
    
    public static function PesquisaCredenciado(){
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
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmCredenciado($id){
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
    
    public static function PesquisaRazaoCredenciadoId($id){
        $tabela = Constantes::CREDENCIADO_TABELA." cre"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = cre.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id}","pes.nome_razao");
        $result   = $pesquisa->getResult();
        return $result[0]["nome_razao"];
    }
    
    public static function DeletaCredenciado($id){
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
    
    public static function DeletaProcedimentoCredenciado($id_cre,$id_proc){   
        $deleta = new Deleta();       
        $deleta->Deletar(Constantes::PROCEDIMENTO_CREDENCIADO_TABELA,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id_cre and id_procedimento = :id_proc","id_cre={$id_cre}&id_proc={$id_proc}");
        return $deleta->getResult();      
    }
    
}