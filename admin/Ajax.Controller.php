<?php
/* 
 * Controla as validações dos Formuláriso
 */
if(file_exists("../library/Config.inc.php")):
    include "../library/Config.inc.php";
else:
   include "library/Config.inc.php";
endif;

if(isset($_GET['valida'])){    
    
	switch($_GET['valida']){
    
////////////////////////////////////////////////////////////////////////
/////////////////// PARTICULARIDADES DO SISTEMA ////////////////////////
//////////////////////////////////////////////////////////////////////// 
    
/*****************************
Vinculação do Veterinario
*****************************/	
        case 'vincula_veterinario': 
            $cred     = $_GET['cred'];    
            $vet[Constantes::VETERINARIO_CHAVE_PRIMARIA]      = $_GET['vet'];    
          
            echo CredenciadoModel::AtualizaCredenciado($vet, $cred);
        break;
    
/*****************************
Pesquisa Veterinario Vinculado
*****************************/	
        case 'pesquisa_vinculo_veterinario': 
            $id  = $_GET['cred'];    
            $res = VeterinarioModel::PesquisaUmVeterinarioVinculado($id);
            echo $res[0][Constantes::VETERINARIO_CHAVE_PRIMARIA];
        break;
            
}}