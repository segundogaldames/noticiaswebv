<!DOCTYPE html>
<html>
   <head>
   	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="frame de aplicaciones web">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{$title|default:"Noticias Vespertinas"}</title>

    {include file="link_css.tpl"}


   </head>
   <body>
    {include file="menu.tpl"}

    <div class="container-fluid">
      <div class="row">
        <div class="col-md-2">
          <div class="dropdown">
            <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              Usuarios
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="{$_layoutParams.root}roles">Roles</a></li>
              <li><a class="dropdown-item" href="{$_layoutParams.root}usuarios">Usuarios</a></li>
            </ul>
          </div>
          <nav class="nav flex-column">
            <a class="nav-link text-dark" aria-current="page" href="#">Active</a>
            <a class="nav-link text-dark" href="#">Link</a>
            <a class="nav-link text-dark" href="#">Link</a>
          </nav>
        </div>
        <div class="col-md-10">
          {include file=$_content}
        </div>
      </div>

    </div>

    {include file="link_js.tpl"}

    <noscript>
      <p>Debe tener el soporte de Javascript habilitado</p>
    </noscript>

    {if isset($_layoutParams.js) && count($_layoutParams.js)}
      {foreach item=js from=$_layoutParams.js}
        <script type="text/javascript" src="{$js}"></script>
      {/foreach}

    {/if}
  </body>
</html>