<?php

namespace App\Http\Controllers\Front;

use App\Shop\Addresses\Address;
use App\Shop\Customers\Customer;
use App\Shop\Countries\Country;
use App\Shop\Addresses\Repositories\Interfaces\AddressRepositoryInterface;
use App\Shop\Addresses\Requests\CreateAddressRequest;
use App\Shop\Cities\Repositories\Interfaces\CityRepositoryInterface;
use App\Shop\Countries\Repositories\Interfaces\CountryRepositoryInterface;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Shop\Countries\Repositories\CountryRepository;
use App\Http\Controllers\Controller;
use App\Shop\Provinces\Repositories\Interfaces\ProvinceRepositoryInterface;
use App\Shop\Addresses\Repositories\AddressRepository;
use App\Shop\Addresses\Requests\UpdateAddressRequest;
use App\Shop\Addresses\Transformations\AddressTransformable;
use App\Shop\Cities\City;


class CustomerAddressController extends Controller
{
    use AddressTransformable;
    private $addressRepo;
    private $customerRepo;
    private $countryRepo;
    private $cityRepo;
    private $provinceRepo;

    public function __construct(
        AddressRepositoryInterface $addressRepository,
        CustomerRepositoryInterface $customerRepository,
        CountryRepositoryInterface $countryRepository,
        CityRepositoryInterface $cityRepository,
        ProvinceRepositoryInterface $provinceRepository
    ) {
        $this->addressRepo = $addressRepository;
        $this->customerRepo = $customerRepository;
        $this->countryRepo = $countryRepository;
        $this->cityRepo = $cityRepository;
        $this->provinceRepo = $provinceRepository;
    }

    public function index(int $customerId)
    {
        $customer = $this->customerRepo->findCustomerById($customerId);

        return view('front.customers.addresses.list', [
            'customer' => $customer,
            'addresses' => $customer->addresses
        ]);
    }

    public function create(int $customerId)
    {
        $country = $this->countryRepo->findCountryById(env('COUNTRY_ID'));
        $countries = $this->countryRepo
            ->listCountries()
            ->except(env('COUNTRY_ID'))
            ->prepend($country);

        return view('front.customers.addresses.create', [
            'customers' => $this->customerRepo->listCustomers(),
            'customer' => $this->customerRepo->findCustomerById($customerId),
            'countries' => $countries,
            'provinces' => $country->provinces,
            'cities' => $this->cityRepo->listCities()
        ]);
    }

    public function store(CreateAddressRequest $request, int $customerId)
    {
        $request['customer'] = $customerId;
        $this->addressRepo->createAddress($request->except('_token', '_method'));

        $request->session()->flash('message', 'Address creation successful');
        return redirect()->route('accounts');
    }

    public function show(int $customerId)
    {
        $address = $this->addressRepo->findCustomerAddressById($customerId);
        $addressRepo = new AddressRepository($address);
        $customer = $addressRepo->findCustomer();
        return view('front.customers.addresses.show', [
            'address' => $this->addressRepo->findCustomerAddressById($customerId),
            'customer' => $customer,
        ]);
    }

    public function edit(int $customerId)
    {
        $countries = $this->countryRepo->listCountries();
        $philippines = $countries->find(['id' => env('COUNTRY_ID')])->first();
        $countryRepo = new CountryRepository($philippines);
        $address = $this->addressRepo->findCustomerAddressById($customerId);
        $addressRepo = new AddressRepository($address);
        $customer = $addressRepo->findCustomer();

        return view('front.customers.addresses.edit', [
            'customers' => $this->customerRepo->listCustomers(),
            'customer' => $customer,
//            'customer' => $this->customerRepo->findCustomerById($customerId),
            'countries' => $countries,
            'address' => $address,
            'provinces' => $countryRepo->findProvinces(),
            'cities' => $this->cityRepo->listCities()
        ]);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateAddressRequest $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAddressRequest $request, $customerId)
    {
        $address = $this->addressRepo->findCustomerAddressById($customerId);
        $update = new AddressRepository($address);
        $update->updateAddress($request->except('_method', '_token'));

        $request->session()->flash('message', 'Update successful');
        return redirect()->route('accounts');
//        return redirect()->route('customer.address.index', $customerId);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($customerId)
    {
        $address = $this->addressRepo->findCustomerAddressById($customerId);
        $delete = new AddressRepository($address);
        $delete->deleteAddress();

        request()->session()->flash('message', 'Delete successful');
        return redirect()->route('accounts');

    }
}
