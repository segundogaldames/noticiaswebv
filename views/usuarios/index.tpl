<div class="card">
    <div class="card-body">
        <h1 class="card-title">
            {$asunto}
            <a href="{$_layoutParams.root}usuarios/create" class="btn btn-outline-secondary">Nuevo Usuario</a>
        </h1>
        {include file="../partials/_messages.tpl"}
        {if isset($usuarios) && count($usuarios)}
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>RUN</th>
                        <th>Nombre</th>
                        <th>Rol</th>
                        <th>Activo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$usuarios item=model}
                        <tr>
                            <td>{$model.id}</td>
                            <td>{$model.rut}</td>
                            <td>{$model.nombre}</td>
                            <td>{$model.role.nombre}</td>
                            <td>
                                {if $model.activo == 1}
                                    <span class="badge text-bg-success">Si</span>
                                {else}
                                    <span class="badge text-bg-warning">No</span>
                                {/if}
                            </td>
                            <td>
                                <a href="{$_layoutParams.root}usuarios/show/{$model.id}" class="btn btn-success btn-sm">Ver</a>
                                <a href="{$_layoutParams.root}usuarios/edit/{$model.id}" class="btn btn-warning btn-sm">Editar</a>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        {else}
            <p class="text-info">{$notice}</p>
        {/if}
    </div>
</div>