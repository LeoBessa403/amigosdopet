<?php
          
class Planos{
    
    function ListarPlanos(){
        
        // CADASTRA OS PROCEDIMENTOS VINCULADOS AO CREDENCIADO
        if(!empty($_POST['vincula-procedimentos-plano'])):
            $dados = $_POST;
            $proc['id_plano'] = $dados["id_plano"];
            unset($dados["id_plano"],$dados['vincula-procedimentos-plano']);
            $ok = "";
            $proc_plano = PlanoModel::PesquisaTodosProcedimentosPlano($proc['id_plano']); 
            $proc_ja_atendidos = array();
            foreach ($proc_plano as $key => $value) {            
                $proc_ja_atendidos[$value['id_procedimento']] = $value['quantidade'];
            } 
            
            foreach ($dados as $key => $value) {
                if($value != ""): 
                    if(strpos($key,"valor-") !== false):                        
                        $proc['id_procedimento'] = str_replace("valor-", "", $key);
                        $proc['quantidade'] = $value;                        
                      
                        if(array_key_exists($proc['id_procedimento'], $proc_ja_atendidos)):
                            unset($proc_ja_atendidos[$proc['id_procedimento']]);
                        endif;
                        
                        $cadastrado = PlanoModel::PesquisaProcedimentoInclusoPlano($proc['id_plano'], $proc['id_procedimento']);
                        if(empty($cadastrado)):
                            $ok = PlanoModel::CadastraProcedimentosPlano($proc);
                        else:
                            $quantidade['quantidade'] = $proc['quantidade'];
                            $ok = PlanoModel::AtualizaProcedimentoInclusoPlano($quantidade, $proc['id_plano'], $proc['id_procedimento']);
                        endif;
                    endif;
                endif;
            }
           
            foreach ($proc_ja_atendidos as $id => $nao) {
                PlanoModel::DeletaProcedimentoPlano($proc['id_plano'], $id);
            }
            
            $this->result = $ok;
        endif;
        
        $this->result = PlanoModel::PesquisaPlano();
    }
    
    function ListarProcedimentosPlano(){
           
        $id_pla             = UrlAmigavel::PegaParametro("pla");    
        $this->result       = PlanoModel::PesquisaTodosProcedimentosPlanosAtendidos($id_pla);
        $this->plano        = PlanoModel::PesquisaUmPlano($id_pla);
    }
    
    function Cobertura(){
        
    }
    
}
?>
   