<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="#">
										Cadastro
									</a>
								</li>
								<li class="active">
									Plano
								</li>
							</ol>
							<div class="page-header">
								<h1>Plano <small>Cadastrados</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Plano Cadastrados
								</div>
								<div class="panel-body">                                                                  
									<?php
                                                                            Modal::load(); 
                                                                            Modal::deletaRegistro("Plano");
                                                                            Modal::confirmacao("confirma_Plano");
                                                                            
                                                                            $arrColunas = array('Nome','Valor R$','Região','Ação');
                                                                            $grid = new Grid();
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();
                                                                            
                                                                            foreach ($result as $res): 
                                                                                $acao = '<a href="'.PASTAADMIN.'Plano/CadastroPlano/'.Valida::GeraParametro("pla/".$res['id_plano']).'" class="btn btn-primary tooltips" 
                                                                                               data-original-title="Editar Registro" data-placement="top">
                                                                                                <i class="fa fa-clipboard"></i>
                                                                                            </a>
                                                                                            <a href="'.PASTAADMIN.'Plano/ProcedimentosPlano/'.Valida::GeraParametro("pla/".$res['id_plano']).'" class="btn btn-green tooltips" 
                                                                                               data-original-title="Procedimentos do Plano" data-placement="left">
                                                                                                <i class="clip-inject"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_plano'].'" 
                                                                                               href="#Plano" data-original-title="Excluir Registro" data-placement="top">
                                                                                                <i class="fa fa-trash-o"></i>
                                                                                            </a>';
                                                                                $grid->setColunas($res['nome']);
                                                                                $grid->setColunas(Valida::formataMoeda($res['preco']));
                                                                                $grid->setColunas($res['regiao']."-".$res['uf']);
                                                                                $grid->setColunas($acao,3);
                                                                                $grid->criaLinha($res['id_plano']);
                                                                            endforeach;
                                                                           
                                                                            $grid->finalizaGrid();
                                                                        ?>
                                                                 </div>
							</div>
							<!-- end: DYNAMIC TABLE PANEL -->
						</div>
					</div>
                                        <!-- end: PAGE CONTENT-->
				</div>
			</div>
			<!-- end: PAGE -->