<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="#">
										Procedimentos
									</a>
								</li>
								<li class="active">
									Listar
								</li>
							</ol>
							<div class="page-header">
								<h1>Procedimentos <small>Listar Procedimentos</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <i class="fa fa-external-link-square"></i>
                                                                        Procedimentos 
								</div>
								<div class="panel-body">                                                                  
									<?php
                                                                            Modal::load(); 
                                                                            Modal::deletaRegistro("Procedimento");
                                                                            Modal::confirmacao("confirma_Procedimento");
                                                                            $grid = new Grid();
                                                                            $grid->criaBotaoExportacao('Procedimento', 'ExportarProcedimento');
                                                                            $arrColunas = array('Código','Nome','Categoria','Carência','Periodicidade','Ação');
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();
                                                                             
                                                                            foreach ($result as $res): 
                                                                                $acao = '<a href="'.PASTAADMIN.'Procedimento/CadastroProcedimento/'.Valida::GeraParametro('pro/'.$res['id_procedimento']).'" class="btn btn-primary tooltips" 
                                                                                               data-original-title="Editar Registro" data-placement="top">
                                                                                                <i class="fa fa-clipboard"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_procedimento'].'" 
                                                                                               href="#Procedimento" data-original-title="Excluir Registro" data-placement="top">
                                                                                                <i class="fa fa-trash-o"></i>
                                                                                            </a>';
                                                                                $grid->setColunas($res['codigo']);
                                                                                $grid->setColunas($res['nome']);
                                                                                $grid->setColunas($res['nome_procedimento']);
                                                                                $grid->setColunas($res['carencia']);
                                                                                $grid->setColunas($res['periodicidade']);
                                                                                $grid->setColunas($acao,2);
                                                                                $grid->criaLinha($res['id_procedimento']);
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