<div class="card">
    <div class="card-body">
        <h1 class="card-title">
            {$asunto}
        </h1>
        <div class="col-md-6">
            {include file="../partials/_messages.tpl"}
            <form action="{$_layoutParams.root}{$process}" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Ingrese su email">
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                    <input type="password" name="password" class="form-control" id="password"
                        placeholder="Ingrese su password">
                </div>

                <div class="mb-3">
                    <input type="hidden" name="send" value="{$send}">
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>
            </form>
        </div>
    </div>
</div>