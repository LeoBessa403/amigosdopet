<div class="main-content">
        <div class="container">
                    <div class="row">
                                  <div class="col-sm-12">
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-grid-6"></i>
									<a href="#">
										Veterinarios
									</a>
								</li>
								<li class="active">
									Veterinarios
								</li>
							</ol>
							<div class="page-header">
								<h1>Veterinarios <small>Listar Veterinarios</small></h1>
							</div>
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
        
        
                            <div class="row">
					<div class="col-md-12">
                                                    <div class="panel panel-default">
                                                                <div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									Listar Veterinarios
								</div>
								<div class="panel-body">                                                                  
									<?php
                                                                            Modal::load(); 
                                                                            Modal::deletaRegistro("Veterinario");
                                                                            Modal::confirmacao("confirma_Veterinario");
                                                                            
                                                                            $arrColunas = array('Nome / Razão Social','CPF / CNPJ','Telefones','E-mail','Cidade','Ação');
                                                                            $grid = new Grid();
                                                                            $grid->setColunasIndeces($arrColunas);
                                                                            $grid->criaGrid();
                                                                             
                                                                            foreach ($result as $res): 
                                                                                $acao = '<a href="'.PASTAADMIN.'Veterinario/CadastroVeterinario/'.Valida::GeraParametro('vet/'.$res['id_veterinario']).'" class="btn btn-primary tooltips" 
                                                                                               data-original-title="Editar Registro" data-placement="top">
                                                                                                <i class="fa fa-clipboard"></i>
                                                                                            </a>
                                                                                            <a data-toggle="modal" role="button" class="btn btn-bricky tooltips deleta" id="'.$res['id_veterinario'].'" 
                                                                                               href="#Veterinario" data-original-title="Excluir Registro" data-placement="top">
                                                                                                <i class="fa fa-trash-o"></i>
                                                                                            </a>';
                                                                                $grid->setColunas($res['nome_razao']);
                                                                                $grid->setColunas($res['cpf_cnpj']);
                                                                                $grid->setColunas($res['tel1']." / ".$res['tel2']);
                                                                                $grid->setColunas($res['email']);
                                                                                $grid->setColunas($res['cidade']."-".$res['estado']);
                                                                                $grid->setColunas($acao,2);
                                                                                $grid->criaLinha($res['id_veterinario']);
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