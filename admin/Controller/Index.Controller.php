<?php
          
class Index{
    

    function Index(){
//        $email = new Email();
//        
//        $email->setMensagem("<h1>Mensagem de Teste de Envio OK, Amigos dod Pet.</h1>")
//              ->setNomeDestinatario("Marcelo Moura")
//              ->setEmailDestinatario("leonardomcbessa@gmail.com")
//              ->setTitulo("Mensagem de Teste")
//              ->Enviar();  
              
    }
    
    public static function Logar(){     
 // CLASSE DE LOGAR
        $login = Valida::LimpaVariavel($_POST['user']);
        $senha = Valida::LimpaVariavel($_POST['senha']);
        
         if(($login != "") && ($senha != "")):
            $acesso = new Pesquisa();

            $acesso->Pesquisar(TABLE_USER);
            $user = "";
            foreach ($acesso->getResult() as $result):
                if (($result[CAMPO_USER] == $login) && ($result[CAMPO_PASS] == $senha)):
                    $user = $result; 
                    break;
                endif;
            endforeach;

            if($user != ""):          
                $user["session_id"] = session_id();               
                $user["ultimo_acesso"] = strtotime(Valida::DataDB(Valida::DataAtual()));  
                
                $usuario = new Session();
                $usuario->setUser($user);
                $usuario->setSession(SESSION_USER,$usuario);
                echo "<script type='text/javascript'>"
                        . "window.location.href = '".HOME.ADMIN.LOGADO."';"
                     . "</script>";
            else:
                Redireciona(ADMIN.LOGIN."?o=alerta2");
            endif;
        else:
                Redireciona(ADMIN.LOGIN."?o=info2");
        endif;     
    }
    
    
}
?>
   