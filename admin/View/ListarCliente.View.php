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
									Cliente
								</li>
							</ol>
							<div class="page-header">
								<h1>Cliente <small>Cadastrados</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Cliente Cadastrados
								</div>
								<div class="panel-body">                                                                  
									<?php
                                                                            Modal::load(); 
                                                                            Modal::deletaRegistro("Cliente");
                                                                            Modal::confirmacao("confirma_Cliente");
                                                                            Modal::Foto();
                                                                            $arrColunas = array('Nome','Raça','Carterinha','Sexo','Ação');
                                                                            $grid = new Grid();
                                                                            $grid->criaBotaoExportacao('Cliente', 'ExportarCliente');
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();

                                                                            foreach ($result as $res): 
                                                                                $acao = '<a href="'.PASTAADMIN.'Cliente/CadastroCliente/'.Valida::GeraParametro('cli/'.$res['id_cliente']).'" class="btn btn-primary tooltips" 
                                                                                               data-original-title="Editar Registro" data-placement="top">
                                                                                                <i class="fa fa-clipboard"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_cliente'].'" 
                                                                                               href="#Cliente" data-original-title="Excluir Registro" data-placement="top">
                                                                                                <i class="fa fa-trash-o"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-med-grey fotos" id="'.$res['id_cliente'].'" 
                                                                                               href="#Foto" title="'.$res['nome'].'" data-placement="top">
                                                                                                <i class="fa fa-camera"></i>
                                                                                            </a>';
                                                                                $grid->setColunas($res['nome']);
                                                                                $grid->setColunas($res['raca']);
                                                                                $grid->setColunas($res['carterinha']);
                                                                                $grid->setColunas($res['sexo']);
                                                                                $grid->setColunas($acao,3);
                                                                                $grid->criaLinha($res['id_cliente']);
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