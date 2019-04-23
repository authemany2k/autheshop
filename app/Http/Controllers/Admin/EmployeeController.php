<?php
namespace App\Http\Controllers\Admin;

use App\Shop\Admins\Requests\CreateEmployeeRequest;
use App\Shop\Admins\Requests\UpdateEmployeeRequest;
use App\Shop\Employees\Repositories\EmployeeRepository;
use App\Shop\Employees\Repositories\Interfaces\EmployeeRepositoryInterface;
use App\Http\Controllers\Controller;
use Session;
use DB;
use App\Roles\Role;

class EmployeeController extends Controller
{
    /**
     * @var EmployeeRepositoryInterface
     */
    private $employeeRepo;
    /**
     * EmployeeController constructor.
     * @param EmployeeRepositoryInterface $employeeRepository
     */
    public function __construct(EmployeeRepositoryInterface $employeeRepository)
    {
        $this->employeeRepo = $employeeRepository;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employeeRoles = DB::table('employee_role')->get();
        $roles = Role::all();

        $list = $this->employeeRepo->listEmployees('created_at', 'desc');
        return view('admin.employees.list', [
            'employeeRoles'=> $employeeRoles,
            'roles' => $roles,
             'employees' => $this->employeeRepo->paginateArrayResults($list, 25),
        ]);

    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.employees.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateEmployeeRequest  $request
     * @return \Illuminate\Http\Response
     */


    public function store(CreateEmployeeRequest $request)
    {
        $this->employeeRepo->createEmployee($request->all());
        return redirect()->route('admin.employees.index');

    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $employeeRoles = DB::table('employee_role')->get();
        $roles = Role::all();

        $employee = $this->employeeRepo->findEmployeeById($id);
        return view('admin.employees.show', [
            'employee' => $employee,

            'employeeRoles'=>$employeeRoles,
            'roles' => $roles
        ]);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(int $id)
    {
        $employeeRoles = DB::table('employee_role')->get();
        $roles = Role::all();
        $employee = $this->employeeRepo->findEmployeeById($id);
        return view('admin.employees.edit', [
            'employee' => $employee,
             'employeeRoles' => $employeeRoles,
            'roles' => $roles
            ]);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param UpdateEmployeeRequest $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateEmployeeRequest $request, $id)
    {
        $employee = $this->employeeRepo->findEmployeeById($id);
        $this->updateEmployee($request, $id);

        // If only one user is a Super Admin, don't allow the Super Admin to change role
        $employeeRole = DB::table('employee_role')
            ->where('employee_id', $employee->id)
            ->first();
        $superAdminRole = Role::where('name', '=', 'superadmin')->first();
        $superAdminCount = DB::table('employee_role')
            ->where('role_id', $superAdminRole->id)
            ->count();

        // Check if the user being edited, is not already a Super Admin
        if ($employeeRole->role_id == $superAdminRole->id && $employeeRole->role_id != $request->role_id) {
            if ($superAdminCount == 1) {
                // Toastr popup
                Session::flash('status', 'warning');
                Session::flash('title', 'Employee: ' . $request->name);
                Session::flash('message', 'Cannot change role as there must be one (1) or more users with the role of ' . $superAdminRole->display_name . '.');

                return redirect('/admin/employees/' . $employee->id . '/edit');
            } else {
                // Update the user's role
                DB::table('employee_role')
                    ->where('employee_id', $employee->id)
                    ->update(['role_id' => $request->role_id]);

                // Toastr popup upon successful user update
                Session::flash('status', 'success');
                Session::flash('title', 'Employee: ' . $request->name);
                Session::flash('message', 'Successfully updated');
            }
        } else {
            // Update the user's role
            DB::table('employee_role')
                ->where('employee_id', $employee->id)
                ->update(['role_id' => $request->role_id]);

            // Toastr popup upon successful user update
            Session::flash('status', 'success');
            Session::flash('title', 'Employee: ' . $request->name);
            Session::flash('message', 'Successfully updated');
        }

        $request->session()->flash('message', 'Update successful');
        return redirect()->route('admin.employees.edit', $id);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        DB::table('employee_role')->where('employee_id',$id)->delete();

        $this->employeeRepo->delete($id);
        request()->session()->flash('message', 'Delete successful');
        return redirect()->route('admin.employees.index');
    }
    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getProfile($id)
    {
        $employeeRoles = DB::table('employee_role')->get();
        $roles = Role::all();

        $employee = $this->employeeRepo->findEmployeeById($id);
        return view('admin.employees.profile', [
            'employee' => $employee,
            'employeeRoles' => $employeeRoles,
            'roles' => $roles

        ]);
    }
    /**
     * @param UpdateEmployeeRequest $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function updateProfile(UpdateEmployeeRequest $request, $id)
    {
        $this->updateEmployee($request, $id);
        $request->session()->flash('message', 'Update successful');
        return redirect()->route('admin.employee.profile', $id);
    }
    /**
     * @param UpdateEmployeeRequest $request
     * @param $id
     */
    private function updateEmployee(UpdateEmployeeRequest $request, $id)
    {
        $employee = $this->employeeRepo->findEmployeeById($id);
        $update = new EmployeeRepository($employee);
        $update->updateEmployee($request->except('_token', '_method'));
    }
}