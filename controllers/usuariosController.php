<?php
use models\Usuario;
use models\Role;

class usuariosController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->validateAdminEditor();
        $this->getMessages();

        $this->_view->assign('title','Usuarios');
        $this->_view->assign('asunto','Lista de Usuarios');
        $this->_view->assign('notice','No hay usuarios disponibles');
        $this->_view->assign('usuarios', Usuario::with('role')->orderBy('id','desc')->get());//select id, nombre from roles
        $this->_view->render('index');
    }

    public function create()
    {
        $this->validateAdmin();
        $this->getMessages();

        $this->_view->assign('title','Usuarios');
        $this->_view->assign('asunto','Nuevo Usuario');
        $this->_view->assign('action', 'Crear');
        $this->_view->assign('process', "usuarios/store");
        $this->_view->assign('usuario', Session::get('data'));
        $this->_view->assign('roles', Role::select('id','nombre')->orderBy('nombre')->get());
        $this->_view->assign('send', $this->encrypt($this->getForm()));
        $this->_view->render('create');
    }

    public function store()
    {
        $this->validateAdmin();
        $this->validateForm('usuarios/create',[
            'rut' => Filter::getText('rut'),
            'nombre' => Filter::getText('nombre'),
            'email' => $this->validateEmail(Filter::getPostParam('email')),
            'rol' => Filter::getText('rol'),
            'password' => Filter::getSql('password'),
        ]);

        if (!$this->validateRut(Filter::getText('rut'))) {
            Session::set('msg_error','El RUT ingresado no es válido');
            $this->redirect('usuarios/create');
        }

        $usuario = Usuario::select('id')
            ->where('rut', Filter::getText('rut'))
            ->where('email', Filter::getPostParam('email'))
            ->first();

        if ($usuario) {
            Session::set('msg_error','El usuario ingresado ya existe... intente con otro');
            $this->redirect('usuarios/create');
        }

        if(strlen(Filter::getSql('password')) < 8){
            Session::set('msg_error','El password debe contener al menos 8 caracteres');
            $this->redirect('usuarios/create');
        }

        if (Filter::getSql('password') != Filter::getSql('repassword')) {
            Session::set('msg_error','Los passwords ingresados no coinciden... intente nuevamente');
            $this->redirect('usuarios/create');
        }

        $usuario = new Usuario;
        $usuario->rut = Filter::getText('rut');
        $usuario->nombre = Filter::getText('nombre');
        $usuario->email = Filter::getPostParam('email');
        $usuario->password = Helper::encryptPassword(Filter::getSql('password'));
        $usuario->activo = 1;//activo
        $usuario->role_id = Filter::getInt('rol');
        $usuario->save();

        Session::destroy('data');
        Session::set('msg_success', 'El usuario se ha registrado correctamente');
        $this->redirect('usuarios');
    }

    public function show($id = null)
    {
        $this->validateAdminEditor();
        Validate::validateModel(Usuario::class, $id, 'error/error');

        $this->getMessages();

        $this->_view->assign('title','Usuarios');
        $this->_view->assign('asunto','Detalle Usuario');
        $this->_view->assign('usuario', Usuario::with('role')->find(Filter::filterInt($id)));//select id, nombre from roles
        $this->_view->render('show');
    }

    public function edit($id = null)
    {
        $this->validateAdmin();
        Validate::validateModel(Usuario::class, $id, 'error/error');

        $this->getMessages();

        $this->_view->assign('title','Usuarios');
        $this->_view->assign('asunto','Editar Usuario');
        $this->_view->assign('action', 'Editar');
        $this->_view->assign('process', "usuarios/update/{$id}");
        $this->_view->assign('usuario', Usuario::with('role')->find(Filter::filterInt($id)));
        $this->_view->assign('roles', Role::select('id','nombre')->orderBy('nombre')->get());
        $this->_view->assign('send', $this->encrypt($this->getForm()));
        $this->_view->render('edit');
    }

    public function update($id = null)
    {
        $this->validateAdmin();
        Validate::validateModel(Usuario::class, $id, 'error/error');
        $this->validatePUT();

        $this->validateForm("usuarios/edit/{$id}",[
            'rut' => Filter::getText('rut'),
            'nombre' => Filter::getText('nombre'),
            'email' => $this->validateEmail(Filter::getPostParam('email')),
            'activo' => Filter::getText('activo'),
            'rol' => Filter::getText('rol')
        ]);

        if (!$this->validateRut(Filter::getText('rut'))) {
            Session::set('msg_error','El RUT ingresado no es válido');
            $this->redirect('usuarios/create');
        }

        $usuario = Usuario::find(Filter::filterInt($id));
        $usuario->rut = Filter::getText('rut');
        $usuario->nombre = Filter::getText('nombre');
        $usuario->email = Filter::getPostParam('email');
        $usuario->activo = Filter::getInt('activo');
        $usuario->role_id = Filter::getInt('rol');
        $usuario->save();

        Session::destroy('data');
        Session::set('msg_success', 'El usuario se ha modificado correctamente');
        $this->redirect('usuarios/show/' . $id);
    }
}
