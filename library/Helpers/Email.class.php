<?php

/**
 * Upload.class [ HELPER ]
 * Reponsável por envio de E-mails do Sistema!
 * 
 * @copyright (c) 2015, Leonardo Bessa
 */
class Email {

    private $Email_Destinatario;
    private $Nome_Destinatario;
    private $Email_Remetente;
    private $Senha_Email_Remetente;
    private $Titulo;
    private $Mensagem;
  
    /**
     * <b>setClasses:</b> ionicia o formulário e suas configurações
     * @param STRING $idform: atribui o ID para o Formulário
     */
    function __construct($Email_Remetente = null, $Senha_Email_Remetente = null){
        $this->Email_Remetente = ($Email_Remetente)? $Email_Remetente : USER_EMAIL; 
        $this->Senha_Email_Remetente = ($Senha_Email_Remetente)? $Senha_Email_Remetente : PASS_EMAIL;
    }

    /**
     * Verifica e cria o diretório padrão de uploads no sistema!<br>
     * <b>../uploads/</b>
     */
    function Enviar() {
        require 'PHPMailer/class.phpmailer.php';
        $mail = new PHPMailer(true);
        $mail->IsSMTP();

        $mail->Host       = HOST_EMAIL;
        $mail->Port       = PORTA_EMAIL;
        $mail->SMTPDebug  = 2;                     
        $mail->SMTPAuth   = true;
        $mail->Username   = $this->Email_Remetente;
        $mail->Password   = $this->Senha_Email_Remetente;
        $mail->SetFrom($this->Email_Remetente, DESC);
        $mail->AddAddress($this->Email_Destinatario, $this->Nome_Destinatario);
        $mail->Subject = $this->Titulo;
        $mail->AltBody = 'Mensagem de Erro automática, favor não responder!'; // optional - MsgHTML will create an alternate automatically
        $mail->MsgHTML($this->Mensagem);
//            $mail->AddAttachment('images/phpmailer.gif');      // attachment
//            $mail->AddAttachment('images/phpmailer_mini.gif'); // attachment
        if($mail->Send())
            echo "E-mail enviado com Sucesso!";
        else
            echo "Não foi possível o envio. ".$mail->ErrorInfo;
            
    }

    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function setEmailDestinatario($Email_Destinatario) {
        $this->Email_Destinatario = $Email_Destinatario;
        return $this;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function getEmailDestinatario() {
        return $this->Email_Destinatario;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function setNomeDestinatario($Nome_Destinatario) {
        $this->Nome_Destinatario = $Nome_Destinatario;
        return $this;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function getNomeDestinatario() {
        return $this->Nome_Destinatario;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function setTitulo($Titulo) {
        $this->Titulo = $Titulo;
        return $this;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function getTitulo() {
        return $this->Titulo;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function setMensagem($Mensagem) {
        $this->Mensagem = $Mensagem;
        return $this;
    }
    
    /**
     * <b>Enviar Imagem:</b> Basta envelopar um $_FILES de uma imagem e caso queira um nome e uma largura personalizada.
     * Caso não informe a largura será 1024!
     * @param INT $Width = Largura da imagem ( 800 padrão )
     */
    public function getMensagem() {
        return $this->Mensagem;
    }
    

}


  

   