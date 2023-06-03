<p class="text-danger">Campos obligatorios *</p>
<form action="{$_layoutParams.root}{$process}" method="post">
    <div class="mb-3">
        <label for="rut" class="form-label">Rut <span class="text-danger">*</span> </label>
        <input type="text" name="rut" value="{$usuario.rut|default:""}" class="form-control" id="rut" placeholder="RUT del usuario">
    </div>
    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre <span class="text-danger">*</span></label>
        <input type="text" name="nombre" value="{$usuario.nombre|default:""}" class="form-control" id="nombre" placeholder="Nombre del usuario">
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
        <input type="email" name="email" value="{$usuario.email|default:""}" class="form-control" id="email" placeholder="Email del usuario">
    </div>
    <div class="mb-3">
        <label for="rol" class="form-label">Rol <span class="text-danger">*</span></label>
        <select name="rol" id="rol" class="form-control">
            <option value="">Seleccione...</option>
            {foreach from=$roles item=role}
                <option value="{$role.id}">{$role.nombre}</option>
            {/foreach}
        </select>
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
        <input type="password" name="password" class="form-control" id="password" placeholder="Password del usuario">
    </div>
    <div class="mb-3">
        <label for="repassword" class="form-label">Confirmar Password <span class="text-danger">*</span></label>
        <input type="password" name="repassword" class="form-control" id="repassword" placeholder="Reingrese Password del usuario">
    </div>
    <div class="mb-3">
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="send" value="{$send}">
        <button type="submit" class="btn btn-primary">Guardar</button>
    </div>
</form>