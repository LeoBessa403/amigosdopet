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
							</ol>
							<div class="page-header">
								<h1>Credenciados <small>Toda Rede Credenciada</small></h1>
							</div>                          
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Listar Credenciados
								</div>
								<div class="panel-body"> 
                                                                        <?php
                                                                            Modal::load(); 
                                                                        ?>									
                                                                            <?php
                                                                                $arrColunas = array('Nome / Razão Social','Telefones','E-mail','Cidade','Ação');
                                                                                $grid = new Grid();
                                                                                $grid->setColunasIndeces($arrColunas);
                                                                                $grid->criaGrid();
                                                                                
                                                                                foreach ($result as $res): 
                                                                                    $acao = '<a href="'.PASTASITE.'Credenciados/ListarProcedimentosCredenciado/'.Valida::GeraParametro('cre/'.$res['id_credenciado']).'" class="btn btn-green tooltips" 
                                                                                                data-original-title="Procedimentos do Credenciado" data-placement="left">
                                                                                                 <i class="clip-inject"></i>
                                                                                             </a>';
                                                                                    $grid->setColunas($res['nome_razao']);
                                                                                    $grid->setColunas($res['tel1']);
                                                                                    $grid->setColunas($res['email']);
                                                                                    $grid->setColunas($res['cidade']."-".$res['uf']);
                                                                                    $grid->setColunas($acao,1);
                                                                                    $grid->criaLinha($res['id_credenciado']);
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