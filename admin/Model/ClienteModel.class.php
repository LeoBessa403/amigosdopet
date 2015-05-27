<?php

class ClienteModel{
    
    public static function CadastraCliente(array $dados){
        $cadastro = new Cadastra();
        $cadastro->Cadastrar(Constantes::CLIENTE_TABELA, $dados);
        return $cadastro->getUltimoIdInserido();
    }
    
    public static function AtualizaCliente(array $dados,$id){
        $atualiza = new Atualiza();
        $atualiza->Atualizar(Constantes::CLIENTE_TABELA, $dados, "where ".Constantes::CLIENTE_CHAVE_PRIMARIA." = :id", "id={$id}");
        return $atualiza->getResult();
    }
      
    public static function PesquisaCliente(){
        $tabela = Constantes::CLIENTE_TABELA." cli"
                . " inner join ".Constantes::RACA_TABELA." rac"
                . " on rac.".Constantes::RACA_CHAVE_PRIMARIA." = cli.".Constantes::RACA_CHAVE_PRIMARIA;
        
        $campos = "rac.raca, cli.*";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,null,null,$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaFotosUmCliente($id){
        $tabela = Constantes::CLIENTE_TABELA." cli"
                . " inner join tb_foto fot"
                . " on cli.".Constantes::CLIENTE_CHAVE_PRIMARIA." = fot.".Constantes::CLIENTE_CHAVE_PRIMARIA;
        
        $campos = "fot.caminho";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela, "where cli.".Constantes::CLIENTE_CHAVE_PRIMARIA." = :id", "id={$id}",$campos);
        return $pesquisa->getResult();
    }
    
    public static function PesquisaUmCliente($id){
        $tabela = Constantes::CLIENTE_TABELA." cli"
                . " inner join ".Constantes::RACA_TABELA." rac"
                . " on rac.".Constantes::RACA_CHAVE_PRIMARIA." = cli.".Constantes::RACA_CHAVE_PRIMARIA;
        
        $campos = "rac.raca, cli.*";
        
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar($tabela,"where cli.".Constantes::CLIENTE_CHAVE_PRIMARIA." = :id","id={$id}",$campos);
        $result   = $pesquisa->getResult();
        return $result[0];
    }
    
    public static function DeletaCliente($id){
         // NÃO PODE EXCLUIR SE TIVER VINCULO COM ALGUM PLANO OU TITULAR
//        $tabela = self::tabela." pes"              
//                . " inner join ".DadosModel::tabela." dad"
//                . " on dad.".PessoaModel::chave_primaria." = pes.".PessoaModel::chave_primaria
//                . " inner join ".EnderecoModel::tabela." end"
//                . " on end.".PessoaModel::chave_primaria." = pes.".PessoaModel::chave_primaria;
//        
//        $campos = "pes.id_pessoa, dad.id_dados, end.id_endereco";
//        
//        $pesquisa = new Pesquisa();
//        $pesquisa->Pesquisar($tabela,"where pes.".PessoaModel::chave_primaria." = :id","id={$id}",$campos);
//        $deleta = new Deleta();
//        foreach ($pesquisa->getResult() as $res):
            $deleta->Deletar(Constantes::CLIENTE_TABELA, "where ".Constantes::CLIENTE_CHAVE_PRIMARIA." = :id", "id={$id}");
            // FALTA APAGAR AS FOTOS DO CLIENTE
//            $deleta->Deletar(foto::tabela, "where ".EnderecoModel::chave_primaria." = :res", "res={$res['id_dados']}");        
            return $deleta->getResult();
//        endforeach;
    }   
    
    
}