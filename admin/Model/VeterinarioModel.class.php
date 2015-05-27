<?php

class VeterinarioModel{
    
    public static function CadastraVeterinario(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::VETERINARIO_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function AtualizaVeterinario(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::VETERINARIO_TABELA, $dados, "where ".Constantes::VETERINARIO_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
      
    public static function PesquisaVeterinario(){
        $tabela = Constantes::VETERINARIO_TABELA." vet"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = vet.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $campos = "vet.".Constantes::VETERINARIO_CHAVE_PRIMARIA.", pes.nome_razao, pes.cpf_cnpj, dad.tel1, dad.tel2,dad.email, end.cidade, end.estado";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaVinculaVeterinario(){
        $tabela = Constantes::VETERINARIO_TABELA." vet"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = vet.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $campos = "vet.".Constantes::VETERINARIO_CHAVE_PRIMARIA.", pes.nome_razao";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmVeterinario($id){
      $tabela = Constantes::VETERINARIO_TABELA." vet"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = vet.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where ".Constantes::VETERINARIO_CHAVE_PRIMARIA." = :id","id={$id}");
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function PesquisaUmVeterinarioVinculado($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CREDENCIADO_TABELA,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id}",  Constantes::VETERINARIO_CHAVE_PRIMARIA);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmVeterinarioVinculadoDeleta($id){
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(Constantes::CREDENCIADO_TABELA,"where ".Constantes::CREDENCIADO_CHAVE_PRIMARIA." = :id","id={$id}");
        return $pesquisa->getRegistrosEncontrados();
    }
    
    public static function DeletaVeterinario($id){
        $tabela = Constantes::VETERINARIO_TABELA." vet"
                . " inner join ".Constantes::PESSOA_TABELA." pes"
                . " on pes.".Constantes::PESSOA_CHAVE_PRIMARIA." = vet.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::DADOS_TABELA." dad"
                . " on dad.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA
                . " inner join ".Constantes::ENDERECO_TABELA." end"
                . " on end.".Constantes::PESSOA_CHAVE_PRIMARIA." = pes.".Constantes::PESSOA_CHAVE_PRIMARIA;
        
        $campos = "vet.".Constantes::VETERINARIO_CHAVE_PRIMARIA.", pes.".Constantes::PESSOA_CHAVE_PRIMARIA.", dad.".Constantes::DADOS_CHAVE_PRIMARIA.", end.".Constantes::ENDERECO_CHAVE_PRIMARIA."";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where ".Constantes::VETERINARIO_CHAVE_PRIMARIA." = :id","id={$id}",$campos);
        $result   = $pesquisa->getResult();
        
        $quant = self::PesquisaUmVeterinarioVinculadoDeleta($result[0][Constantes::VETERINARIO_CHAVE_PRIMARIA]);
        
        if($quant > 0):
            return Mensagens::ERRO_DELETA_VETERINARIO;
        else:
                $deleta = new Deleta();
                foreach ($pesquisa->getResult() as $res):
                    $deleta->Deletar(Constantes::DADOS_TABELA, "where ".Constantes::DADOS_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::DADOS_CHAVE_PRIMARIA]}");
                    $deleta->Deletar(Constantes::ENDERECO_TABELA, "where ".Constantes::ENDERECO_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::ENDERECO_CHAVE_PRIMARIA]}");
                    $deleta->Deletar(Constantes::PESSOA_TABELA, "where ".Constantes::PESSOA_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::PESSOA_CHAVE_PRIMARIA]}");
                    $deleta->Deletar(Constantes::VETERINARIO_TABELA, "where ".Constantes::VETERINARIO_CHAVE_PRIMARIA." = :res", "res={$res[Constantes::VETERINARIO_CHAVE_PRIMARIA]}");
                    return $deleta->getResult();
                endforeach;
        endif;
    }
    
}