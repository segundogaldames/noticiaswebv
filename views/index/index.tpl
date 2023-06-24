<h1>Lista de Noticias</h1>

{include file="../partials/_messages.tpl"}

{if Session::get('authenticate')}
    <p class="text-primary">Bienvenid@ {Session::get('user_nombre')}</p>
{/if}
