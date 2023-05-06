<div class="card">
    <div class="card-body">
        <h1 class="card-title">
            {$asunto}
        </h1>
        <div class="col-md-6">
            {include file="../partials/_messages.tpl"}
            <form action="{$_layoutParams.root}{$process}" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Rol</label>
                    <input type="text" name="nombre" value="" class="form-control" id="nombre" placeholder="Nombre del rol">
                </div>
                <div class="mb-3">
                    <input type="hidden" name="send" value="{$send}">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>