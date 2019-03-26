# markovchain
Penentuan Peluang Naik Turun Harga Saham Harian 1 Interval dengan Simulasi Markov Chain

Data yang digunakan berasal dari data Yahoo Finance dan contoh yang digunakan merupakan data saham Bank BCA periode 6 November 2017 hingga 6 November 2018 dengan detail data yang diambil sebagai berikut :
<br>
Keterangan :
	Close : Harga Saham Penutupan pada tanggal t.
	Moving Avarage : Harga Saham Penutupan pada tanggal sebelumnya (t-1)
	Delta Price : Selisih antara Moving Avarage – Close
	State dan State Description : Kode status saham dan penjelasannya ada 5 kategori yaitu :
	1 : Naik Drastis
	2 : Naik
	3 : Tetap
	4 : Turun
	5 : Turun Drastis
