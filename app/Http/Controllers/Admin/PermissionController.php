<?php

namespace App\Http\Controllers;

use App\Permissions\Permission;

use DB;
use Alert;
use Illuminate\Http\Request;

class PermissionController extends Controller
{
    public function index(Request $request)
    {
        $permissions = Permission::orderBy('name', 'asc')->paginate(25);
        return view('admin.permissions.index', compact('permissions'))->with('i');
    }

    public function create()
    {
        return view('admin.permissions.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name'         => 'required|unique:permissions,name',
            'display_name' => 'required',
            'description'  => 'required',
        ]);

        $permission = new Permission();
        $permission->name = $request->input('name');
        $permission->display_name = $request->input('display_name');
        $permission->description = $request->input('description');
        $permission->save();

        return redirect('admin/permissions')->with('success', 'Permission created successfully');
    }

    public function show($id)
    {
        $permission = Permission::findOrFail($id);

        return view('admin.permissions.show', compact('permission'));
    }

    public function edit($id)
    {
        $permission = Permission::find($id);

        return view('admin.permissions.edit', compact('permission'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name'         => 'required',
            'display_name' => 'required',
            'description'  => 'required',
        ]);

        $permission = Permission::find($id);
        $permission->name = $request->input('name');
        $permission->display_name = $request->input('display_name');
        $permission->description = $request->input('description');
        $permission->save();

        return redirect('admin/permissions')->with('success', 'Permission updated successfully');
    }

    public function destroy($id)
    {
        DB::table('permissions')->where('id', $id)->delete();
        Alert::success('Successfully Deleted')->autoclose(3000);
        return redirect('admin/permissions')->with('success', 'Permission deleted successfully');
    }
}
