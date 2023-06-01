<form action="{$_layoutParams.root}{$process}" method="post">
    <div class="mb-3">
        <label for="nombre" class="form-label">Rol</label>
        <input type="text" name="nombre" value="{$role.nombre|default:""}" class="form-control" id="nombre" placeholder="Nombre del rol">
    </div>
    <div class="mb-3">
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="send" value="{$send}">
        <button type="submit" class="btn btn-primary">Guardar</button>
    </div>
</form>