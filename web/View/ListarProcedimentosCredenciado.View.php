<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="<?php echo PASTASITE; ?>Credenciados/ListarCredenciado">
										Credenciados
									</a>
								</li>
								<li class="active">
									Credenciado: <small><?php echo $credenciado['nome_razao']; ?>
								</li>
							</ol>
							<div class="page-header">
								<h1>Credenciado: <small><?php echo $credenciado['nome_razao']; ?></small></h1>
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
                                                                            $grid = new Grid();
//                                                                            $grid->criaBotaoExportacao('Procedimento', 'ExportarProcedimento');
                                                                            $arrColunas = array('Código','Nome','Categoria','Carência','Periodicidade');
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();
                                                                             
                                                                            foreach ($result as $res): 
                                                                                $grid->setColunas($res['codigo']);
                                                                                $grid->setColunas($res['nome']);
                                                                                $grid->setColunas($res['categoria']);
                                                                                $grid->setColunas($res['carencia']);
                                                                                $grid->setColunas($res['periodicidade']);
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