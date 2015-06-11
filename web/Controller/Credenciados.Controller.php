<?php

class Credenciados{ 
    
    public $result;
    public $resultAlt;
    public $veterinarios;
    public $credenciado;


    function ListarCredenciado(){
        
        $this->result = CredenciadoModel::pesquisaCredenciado();
        $this->veterinarios = VeterinarioModel::PesquisaVinculaVeterinario();
    }    
        
    function ListarProcedimentosCredenciado(){
           
        $id_cre         = UrlAmigavel::PegaParametro("cre");        
        $this->result   = CredenciadoModel::PesquisaTodosProcedimentosCredenciado($id_cre);
        $this->credenciado = CredenciadoModel::PesquisaUmCredenciado($id_cre);
    }
    
}