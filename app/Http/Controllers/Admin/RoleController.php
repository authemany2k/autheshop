<?php

namespace App\Http\Controllers;

use App\Permissions\Permission;
use App\Roles\Role;
use DB;
use Alert;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index(Request $request)
    {
	    $roles = Role::orderBy('name', 'asc')->paginate(25);
        return view('admin.roles.index', compact('roles'))->with('i');
    }

    public function create()
    {
        $permission = Permission::get();

        return view('admin.roles.create', compact('permission'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name'         => 'required|unique:roles,name',
            'display_name' => 'required',
            'description'  => 'required',
            'permission'   => 'required',
        ]);

        $role = new Role();
        $role->name = $request->input('name');
        $role->display_name = $request->input('display_name');
        $role->description = $request->input('description');
        $role->save();

        foreach ($request->input('permission') as $key => $value) {
            $role->attachPermission($value);
        }

        return redirect('admin/roles')->with('success', 'Role created successfully');
    }

    public function show($id)
    {
        $role = Role::find($id);
        $rolePermissions = Permission::join('permission_role', 'permission_role.permission_id', '=', 'permissions.id')
            ->where('permission_role.role_id', $id)
            ->get();

        return view('admin.roles.show', compact('role', 'rolePermissions'));
    }

    public function edit($id)
    {
        $role = Role::find($id);
        $permission = Permission::get();
        $rolePermissions = DB::table('permission_role')->where('permission_role.role_id', $id)
            ->pluck('permission_role.permission_id', 'permission_role.permission_id')->toArray();

        return view('admin.roles.edit', compact('role', 'permission', 'rolePermissions'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name'         => 'required',
            'display_name' => 'required',
            'description'  => 'required',
            'permission'   => 'required',
        ]);

        $role = Role::find($id);
        $role->name = $request->input('name');
        $role->display_name = $request->input('display_name');
        $role->description = $request->input('description');
        $role->save();

        DB::table('permission_role')->where('permission_role.role_id', $id)
            ->delete();

        foreach ($request->input('permission') as $key => $value) {
            $role->attachPermission($value);
        }

        return redirect('admin/roles')->with('success', 'Role updated successfully');
    }

    public function destroy($id)
    {
        DB::table('permission_role')->where('permission_role.role_id', $id)
            ->delete();
        DB::table('roles')->where('id', $id)->delete();
        Alert::success('Successfully Deleted')->autoclose(3000);
        return redirect('admin/roles')->with('success', 'Role deleted successfully');
    }
}
