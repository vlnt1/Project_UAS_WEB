<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class UserSeeder extends Seeder
{
	public function run()
	{
		$model = model('UserModel');
		$model->insert([
		'username' => 'mikel123',
		'useremail' => 'mikelvalentino47@gmail.com',
		'userpassword' => password_hash('mikel123', PASSWORD_DEFAULT),
		]);
	}
}