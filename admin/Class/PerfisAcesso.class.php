<?php

/**
 * Check.class [ HELPER ]
 * Classe responável por manipular e validade dados do sistema!
 * 
 * @copyright (c) 2014, Leo Bessa
 */
class PerfisAcesso {
    
    /**** PERFIS ****/
    // 1 - MASTER
    // 2 - ADMINISTRADOR
    // 3 - USUARIO CADASTRANTE
    
    
    // Perfil Leo Bessa Total Acesso
    public $SuperPerfil                             = "1";
    
    public $CadastroCategoria                       = "3";
    public $ListarCategoria                         = "3";
    public $ExportarCategoria                       = "3";
    
    
    public $CadastroCliente                         = "3";
    public $ListarCliente                           = "3";
    public $ExportarCliente                         = "3";
    public $EdicaoCliente                           = "";
    
    
    public $CadastroCredenciado                     = "3";
    public $ListarCredenciado                       = "3";
    public $ProcedimentosAtendidos                  = "3";
    public $ListarProcedimentosCredenciado          = "3";
    
    public $CadastroPlano                           = "3";
    public $ListarPlano                             = "3";
    public $ProcedimentosPlano                      = "3";
    public $ListarProcedimentosPlano                = "3";
    public $ExportarPlano                           = "3";
    
    
    public $CadastroProcedimento                    = "3";
    public $ListarProcedimento                      = "3";
    public $ExportarProcedimento                    = "3";
    
    
    public $CadastroRaca                            = "3";
    public $ListarRaca                              = "3";
    
    
    public $CadastroTitular                         = "3";
    public $EdicaoTitular                           = "";
    public $ExcluirTitular                          = "";
    public $ListarTitular                           = "3";
    
    
    public $CadastroVeterinario                     = "3";
    public $ListarVeterinario                       = "3";
    
    
    public $CadastroVendedor                        = "3";
    public $ListarVendedor                          = "3";
    
    
    
}
