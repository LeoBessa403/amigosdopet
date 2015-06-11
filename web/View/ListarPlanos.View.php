<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="<?php echo PASTASITE; ?>">
										Página inicial
									</a>
								</li>
								<li class="active">
									Planos
								</li>
							</ol>
							<div class="page-header">
								<h1>Planos</h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
                                <div class="row" style="margin-bottom: 30px;">
					<div class="col-md-12">
                                                    
                                            
                                                        <section class="wrapper">
                                                            <div class="container">
                                                                    <div id="pricing_table_example1" class="row">
                                                                            <div class="col-sm-12">
                                                                                <?php
                                                                                    foreach ($result as $res): 
                                                                                ?>
                                                                                    <div class="pricing-table featured col-sm-4 col-xs-12">
                                                                                            <h3><?php echo $res['nome']; ?><span><?php echo Valida::formataMoeda($res['preco']); ?></span></h3>
                                                                                            <a href="<?php echo PASTASITE.'Planos/ListarProcedimentosPlano/'.Valida::GeraParametro('pla/'.$res['id_plano']); ?>" class="btn btn-dark-grey">
                                                                                                     <i class="clip-inject"></i> Ver Plano
                                                                                            </a>
                                                                                            <ul>
                                                                                                    <li>
                                                                                                            <b>Região</b>
                                                                                                    </li>
                                                                                                    <li>
                                                                                                            <?php echo $res['regiao']."-".$res['uf']; ?>
                                                                                                    </li>
                                                                                            </ul>
                                                                                    </div>
                                                                                    <?php
                                                                                        endforeach;
                                                                                    ?>

                                                                            </div>
                                                                    </div>
                                                            </div>
                                                    </section>
						</div>
					</div>
                                        <!-- end: PAGE CONTENT-->
                                        
				</div>
			</div>
			<!-- end: PAGE -->