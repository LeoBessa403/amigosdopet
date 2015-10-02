<div class="main-content">
				<div class="container">
					<!-- start: PAGE HEADER -->
					<div class="row">
						<div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-home-3"></i>
									<a href="<?php echo PASTAADMIN;?>index/index">
										Home
									</a>
								</li>
								<li class="active">
									Cadastro de Vendedor
								</li>								
							</ol>
							<div class="page-header">
								<h1>Vendedor <small> Realizar Cadastro e Edição</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
					<!-- end: PAGE HEADER -->
					<!-- start: PAGE CONTENT -->
                                                        <?php
                                                             if($result):
                                                                 Valida::Mensagem(Mensagens::OK_SALVO, 1);
                                                            endif;
                                                            if($resultAlt):
                                                                 Valida::Mensagem(Mensagens::OK_ATUALIZADO, 1);
                                                            endif;
                                                        ?>
                                                                        
                                        <div class="row">
                                            
                                             <?php
                                             
                                                echo $form;
                                             ?>
                                            
					</div>
					<!-- end: PAGE CONTENT-->
				</div>
			</div>