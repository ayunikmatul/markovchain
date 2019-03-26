# markovchain
Penentuan Peluang Naik Turun Harga Saham Harian 1 Interval dengan Simulasi Markov Chain

Data yang digunakan berasal dari data Yahoo Finance dan contoh yang digunakan merupakan data saham Bank BCA periode 6 November 2017 hingga 6 November 2018 dengan detail data yang diambil sebagai berikut :<br>
Keterangan :<br>
	Close : Harga Saham Penutupan pada tanggal t.<br>
	Moving Avarage : Harga Saham Penutupan pada tanggal sebelumnya (t-1).<br>
	Delta Price : Selisih antara Moving Avarage – Close. <br>
	State dan State Description : Kode status saham dan penjelasannya ada 5 kategori yaitu :<br>
	1 : Naik Drastis<br>
	2 : Naik<br>
	3 : Tetap<br>
	4 : Turun<br>
	5 : Turun Drastis
