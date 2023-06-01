<div class="card">
    <div class="card-body">
        <h1 class="card-title">
            {$asunto}
        </h1>
        <div class="col-md-6">
            <table class="table table-hover">
                <tr>
                    <th>Id:</th>
                    <td>{$role.id}</td>
                </tr>
                <tr>
                    <th>Nombre:</th>
                    <td>{$role.nombre}</td>
                </tr>
                <tr>
                    <th>Fecha creación:</th>
                    <td>{$role.created_at}</td>
                </tr>
                <tr>
                    <th>Fecha actualización:</th>
                    <td>{$role.updated_at}</td>
                </tr>
            </table>
            <p>
                <a href="{$_layoutParams.root}roles" class="btn btn-primary">Volver</a>
            </p>
        </div>
    </div>
</div>