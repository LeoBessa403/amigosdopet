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
									Titular
								</li>
							</ol>
							<div class="page-header">
								<h1>Titular <small>Cadastrados</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Titular Cadastrados
								</div>
								<div class="panel-body">                                                                  
									<?php
                                                                            Modal::load(); 
                                                                            Modal::deletaRegistro("Titular");
                                                                            Modal::confirmacao("confirma_Titular");
                                                                            
                                                                            $arrColunas = array('Nome / Razão Social','Contatos','Cidade','Ação');
                                                                            $grid = new Grid();
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();
                                                                             
                                                                            foreach ($result as $res): 
                                                                                $acao = '<a href="'.PASTAADMIN.'Titular/CadastroTitular/'.Valida::GeraParametro('cli/'.$res['id_pessoa']).'" class="btn btn-primary tooltips" 
                                                                                               data-original-title="Editar Registro" data-placement="top">
                                                                                                <i class="fa fa-clipboard"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_pessoa'].'" 
                                                                                               href="#Titular" data-original-title="Excluir Registro" data-placement="top">
                                                                                                <i class="fa fa-trash-o"></i>
                                                                                            </a>';
                                                                                $grid->setColunas($res['nome_razao']);
                                                                                $grid->setColunas($res['tel1']." / ".$res['tel2']);
                                                                                $grid->setColunas($res['cidade']."-".$res['estado']);
                                                                                $grid->setColunas($acao,2);
                                                                                $grid->criaLinha($res['id_pessoa']);
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