<?php
/* 
 * Controller résponsavel para receber e passar dados para controller responsável.
 */
include "../../library/Config.inc.php";

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
            
/*****************************
Pesquisa Fotos do Cliente
*****************************/	
        case 'foto_cliente': 
            $id  = $_GET['id'];    
            $fotos = ClienteModel::PesquisaFotosUmCliente($id);
            echo json_encode($fotos);
        break;
    
    
    
    
            
}} // FIM SWITCH