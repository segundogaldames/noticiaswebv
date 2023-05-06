<?php
use models\Role;

class rolesController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->getMessages();

        $this->_view->assign('title','Roles');
        $this->_view->assign('asunto','Lista de Roles');
        $this->_view->assign('notice','No hay roles disponibles');
        $this->_view->assign('roles', Role::select('id','nombre')->get());//select id, nombre from roles
        $this->_view->render('index');
    }

    public function create()
    {
        $this->getMessages();

        $this->_view->assign('title','Roles');
        $this->_view->assign('asunto','Nuevo Rol');
        $this->_view->assign('process', "roles/store");
        $this->_view->assign('roles', Session::get('data'));
        $this->_view->assign('send', $this->encrypt($this->getForm()));
        $this->_view->render('create');
    }

    public function store()
    {
        $this->validateForm('roles/create',[
            'nombre' => Filter::getText('nombre')
        ]);

        $rol = Role::select('id')->where('nombre', Filter::getText('nombre'))->first();

        if ($rol) {
            Session::set('msg_error','El rol ingresado ya existe... intente con otro');
            $this->redirect('roles/create');
        }

        $rol = new Role;
        $rol->nombre = Filter::getText('nombre');
        $rol->save();

        Session::destroy('data');
        Session::set('msg_success', 'El rol se ha registrado correctamente');
        $this->redirect('roles');
    }
}
