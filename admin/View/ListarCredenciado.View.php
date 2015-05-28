<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="#">
										Credenciados
									</a>
								</li>
								<li class="active">
									Credenciados
								</li>
							</ol>
							<div class="page-header">
								<h1>Credenciados <small>Listar Credenciados</small></h1>
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
                                                                            Modal::deletaRegistro("Credenciado");
                                                                            Modal::confirmacao("confirma_Credenciado");
                                                                        ?>									
                                                                        <!-- VINCULA VETERINARIO AO CREDENCIADO -->
									<div class="modal fade vincula_veterinario" id="Veterinario" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
                                                                                            <div class="modal-header btn-dark-beige">
													<button type="button" class="close cancelar" data-dismiss="modal" aria-hidden="true">
														X
													</button>
													<h4 class="modal-title">Vinculação do Veterinário ao Credenciado</h4>
												</div>
												<div class="modal-body">
                                                                                                    <p>Credenciado: <big><b><span id="credencia"></span></b></big></p>
                                                                                                
                                                                                                    <?php
                                                                                                         echo "<select id='veterinario_selecionado' name='veterinario_selecionado' class='form-control search-select ob'>";
                                                                                                         echo '<option value="" disabled selected>Selecione um Veterinário</option>';
                                                                                                         foreach ($veterinarios as $values):
                                                                                                             echo '<option value="'.$values['id_veterinario'].'">'.$values['nome_razao'].'</option>';
                                                                                                         endforeach;                                                                                                         
                                                                                                         echo "</select>";
                                                                                                    ?>
												</div>
												<div class="modal-footer">
													<button aria-hidden="true" data-dismiss="modal" class="btn btn-bricky cancelar">
														Fechar
													</button>
													<button class="btn btn-success" data-dismiss="modal" id="">
														OK
													</button>
												</div>
											</div>
										</div>
									</div>   
                                                                            <?php
                                                                                $arrColunas = array('Nome / Razão Social','CPF / CNPJ','Telefones','E-mail','Cidade','Ação');
                                                                                $grid = new Grid();
                                                                                $grid->setColunasIndeces($arrColunas);
                                                                                $grid->criaGrid();
                                                                                
                                                                                foreach ($result as $res): 
                                                                                    $acao = '<a href="'.PASTAADMIN.'Credenciado/CadastroCredenciado/'.Valida::GeraParametro('cre/'.$res['id_credenciado']).'" class="btn btn-primary tooltips" 
                                                                                                data-original-title="Editar Registro" data-placement="top">
                                                                                                 <i class="fa fa-clipboard"></i>
                                                                                             </a>
                                                                                             <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_credenciado'].'" 
                                                                                                href="#Credenciado" data-original-title="Excluir Registro" data-placement="top">
                                                                                                 <i class="fa fa-trash-o"></i>
                                                                                             </a>
                                                                                             <a href="'.PASTAADMIN.'Credenciado/ProcedimentosAtendidos/'.Valida::GeraParametro('cre/'.$res['id_credenciado']).'" class="btn btn-green tooltips" 
                                                                                                data-original-title="Vincular Procedimentos" data-placement="left">
                                                                                                 <i class="clip-inject"></i>
                                                                                             </a>
                                                                                             <a data-toggle="modal" role="button" class="btn btn-dark-beige tooltips vincula" id="'.$res['id_credenciado'].'" 
                                                                                                href="#Veterinario" data-original-title="Vincular Veterinário" data-placement="left">
                                                                                                 <i class="fa fa-user-md"></i>
                                                                                             </a>
                                                                                             <a href="'.PASTAADMIN.'Credenciado/ProcedimentosVinculados/'.Valida::GeraParametro('cre/'.$res['id_credenciado']).'" class="btn btn-orange tooltips" 
                                                                                                data-original-title="Procedimentos do Credenciado" data-placement="left">
                                                                                                 <i class="clip-inject"></i>
                                                                                             </a>';
                                                                                    $grid->setColunas($res['nome_razao']);
                                                                                    $grid->setColunas($res['cpf_cnpj']);
                                                                                    $grid->setColunas($res['tel1']);
                                                                                    $grid->setColunas($res['email']);
                                                                                    $grid->setColunas($res['cidade']."-".$res['uf']);
                                                                                    $grid->setColunas($acao,5);
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