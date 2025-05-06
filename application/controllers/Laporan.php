<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_transaksi', 'm_transaksi');
    }

    public function laporanuser($id = '')
    {
        if (!$this->session->userdata('isLogin')) {
            redirect(base_url());
        }
        if ($id !== '') {
            $no_reg = $this->session->userdata('no_reg');
            $user   = $this->db->get_where('siswa', ['no_reg' => $no_reg])->row_array();
            $data['transaksi']     = $this->m_transaksi->getById($id);
            $data['judul_laporan'] = "Laporan Transaksi - " . $user['nama_siswa'];

            $this->load->library('pdf');
            $this->pdf->setPaper('A4', 'landscape');
            $this->pdf->filename = $data['judul_laporan'] . ".pdf";
            $this->pdf->load_view('admin/laporan/view-singgle', $data);
        } else {
            redirect('/');
        }
    }
    public function kembali($id = '')
    {
        if (!$this->session->userdata('isLogin')) {
            redirect(base_url());
        }
        if ($id !== '') {
            $data['transaksi']     = $this->m_transaksi->getById($id);
            $data['judul_laporan'] = "Laporan Transaksi - " . $data['transaksi']['nama_siswa'];

            $this->load->library('pdf');
            $this->pdf->setPaper('A4', 'landscape');
            $this->pdf->filename = $data['judul_laporan'] . ".pdf";
            $this->pdf->load_view('admin/laporan/view-singgle', $data);
        } else {
            redirect('/');
        }
    }
}
