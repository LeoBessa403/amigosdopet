<div class="main-content">
    <div class="container">
        <!-- start: PAGE HEADER -->
        <div class="row">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li>
                        <i class="clip-home-3"></i>
                        <a href="<?php echo PASTAADMIN; ?>index/index">
                            Home
                        </a>
                    </li>
                    <li class="active">
                        Vinculação de Procedimentos para os credenciados
                    </li>
                </ol>
                <div class="page-header">
                    <h1>Procedimentos atendidos
                        <small> Realizar Cadastro e Edição</small>
                    </h1>
                </div>
                <p>Credenciado: </br>
                <h3 style="font-family: serif; font-style: italic; margin-top: 0; padding-top: 0;">
                    <?php echo $credenciado; ?>
                </h3>
                </p>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
        <style>
            .form-control {
                height: 25px;
                width: 100px;
            }

            .valor-apagar {
                display: none;
            }
        </style>

        <!-- end: PAGE HEADER -->
        <!-- start: PAGE CONTENT -->
        <?php
        if ($result):
            Valida::Mensagem("O Cadastro foi Realizado.", 1);
        endif;
        if ($resultAlt):
            Valida::Mensagem("O Cadastro foi Atualizado.", 1);
        endif;
        ?>

        <div class="row">

            <div class="panel-body">
                <form action="<?php echo HOME; ?>admin/Credenciado/ListarCredenciado" role="form"
                      id="vincula-procedimentos-credenciado" name="vincula-procedimentos-credenciado" method="post"
                      enctype="multipart/form-data" class="formulario">

                    <div class="panel-group accordion-custom accordion-teal" id="accordion">

                        <?php
                        foreach ($categorias as $cat):
                            ?>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#cat-<?php echo $cat["id_categoria"]; ?>">
                                            <i class="icon-arrow"></i>
                                            <?php echo $cat["nome"]; ?>
                                        </a></h4>
                                </div>
                                <div id="cat-<?php echo $cat["id_categoria"]; ?>" class="panel-collapse collapse in"
                                     style="padding-left:10px;">
                                    <div class="panel-body">
                                        <label><input id='categoria-<?php echo $cat["id_categoria"]; ?>'
                                                      name='categoria-<?php echo $cat["id_categoria"]; ?>'
                                                      value='categoria-<?php echo $cat["id_categoria"]; ?>'
                                                      class='todos' type='checkbox'/>
                                            Todos dessa Categoria</label><br>
                                        <hr>
                                        <?php
                                        foreach ($procedimentos as $proc):
                                            if ($proc["id_categoria"] == $cat["id_categoria"]):
                                                if (array_key_exists($proc["id_procedimento"], $proc_atendidas)):
                                                    $checked = "checked";
                                                    $preco = Valida::formataMoeda($proc_atendidas[$proc["id_procedimento"]]);
                                                else:
                                                    $checked = "";
                                                    $preco = "";
                                                endif;

                                                ?>
                                                <label><input id="<?php echo $proc["id_procedimento"]; ?>"
                                                              name="<?php echo $proc["id_procedimento"]; ?>"
                                                              value="<?php echo $proc["id_procedimento"]; ?>"
                                                              class="categoria-<?php echo $cat["id_categoria"]; ?> um"
                                                              type="checkbox" <?php echo $checked; ?> />
                                                    <?php echo $proc["nome"]; ?></label>

                                                <div
                                                    class="form-group-<?php echo $proc["id_procedimento"]; ?> valor-apagar grupo-<?php echo $cat["id_categoria"]; ?>">
                                                    <label class="col-xs-2 control-label"
                                                           for="valor-<?php echo $proc["id_procedimento"]; ?>">
                                                        Valor a Ser Pago:
                                                    </label>
                                                    <div class="col-sm-2">
                                                        <input id="valor-<?php echo $proc["id_procedimento"]; ?>"
                                                               name="valor-<?php echo $proc["id_procedimento"]; ?>"
                                                               class="form-control moeda valor-<?php echo $cat["id_categoria"]; ?>"
                                                               type="text" value="<?php echo $preco; ?>"/>
                                                    </div>
                                                </div></br></br>
                                                <?php
                                            endif;
                                        endforeach;
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <?php
                        endforeach;
                        ?>
                    </div>
                    <button data-style="zoom-out" class="btn btn-success ladda-button" type="submit"
                            value="vincula-procedimentos-credenciado" name="vincula-procedimentos-credenciado"
                            style="margin-top: 10px;">
                        <span class="ladda-label"> Salvar </span>
                        <i class="fa fa-save"></i>
                        <span class="ladda-spinner"></span>
                    </button>
                    <button data-style="expand-right" class="btn btn-danger ladda-button" type="reset"
                            style="margin-top: 10px;">
                        <span class="ladda-label"> Limpar </span>
                        <i class="fa fa-ban"></i>
                        <span class="ladda-spinner"></span>
                    </button>
                    <input id="id_credenciado" name="id_credenciado" value="<?php echo $id_cre; ?>" type="hidden"/>
                </form>
            </div>

        </div>
        <!-- end: PAGE CONTENT-->
    </div>
</div>